#!venv/bin/python
#
# Script fetches all details of single doctor from provided link
# inserts data into db if db details are available in the environment
# always prints json to stdout
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from dataclasses import dataclass, asdict
from typing import List, Optional
from os import getenv
import re
import json
import sys
import psycopg


@dataclass
class Location:
    address: str=None
    link: str=None
    phone: str=None
    name: str=None

@dataclass
class Doctor:
    name: str=None
    gender: str=None
    languages: str=None
    link: str=None
    phone: str=None
    locations: List[Location] = None
    rating: str=None
    reviews: str=None
    accept_new: bool=False
    employed: bool=False
    specialities: str=None
    image: str=None

class presence_of_located_elements_shadow_root(object):
  def __init__(self, root, locator):
    self.locator = locator
    self.root = root

  def __call__(self, driver):
    elements = self.root.find_elements(*self.locator)
    return elements

class presence_of_located_element_shadow_root(object):
  def __init__(self, root, locator):
    self.locator = locator
    self.root = root

  def __call__(self, driver):
    element = self.root.find_element(*self.locator)
    return element

def keep_only_numbers(input_string):
    return ''.join(re.findall(r'\d', input_string))
def keep_only_numbers_and_dots(input_string):
    return ''.join(re.findall(r'[0-9.]', input_string))

def parse_doctor(link, driver):
    driver.get(link)
    wait = WebDriverWait(driver, 8)
    root = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'section#loyal-search'))).shadow_root
    wait.until(presence_of_located_element_shadow_root(root, (By.CSS_SELECTOR, '[itemprop="name"]')))
    doctor = Doctor()
    doctor.link = link
    doctor.name = root.find_element(By.CSS_SELECTOR, '[itemprop="name"]').text
    try:
        doctor.specialities = root.find_element(By.CSS_SELECTOR, '[itemprop="medicalSpecialty"]').text
    except:
        pass
    try:
        doctor.phone = keep_only_numbers(root.find_element(By.CSS_SELECTOR, '[data-testref="phone-call-button"]').get_attribute('href'))
    except:
        pass
    try:
        doctor.rating = keep_only_numbers_and_dots(root.find_element(By.CSS_SELECTOR, '[itemprop="ratingValue"]').text.split('/')[0])
    except:
        pass
    try:
        doctor.reviews = keep_only_numbers(root.find_element(By.CSS_SELECTOR, '[itemprop="ratingCount"]').text)
    except:
        pass
    for el in root.find_elements(By.CSS_SELECTOR, '.styles__Badge-sc-o9cga9-6.ieqhXW'):
        if el.text.lower() == 'accepts new patients':
            doctor.accept_new = True
        if el.text.lower() == 'employed provider':
            doctor.employed = True
    try:
        doctor.image = root.find_element(By.CSS_SELECTOR, '[itemprop="provider-image"] > img').get_attribute('src')
    except:
        pass
    # first drop box
    try:
        doctor.gender = root.find_element(By.CSS_SELECTOR, 'div.gender > dd').text
    except:
        pass
    try:
        doctor.languages = root.find_element(By.CSS_SELECTOR, 'div.languages > dd').text
    except:
        pass
    # third drop box
    try:
        root.find_element(By.CSS_SELECTOR, '[data-testref="tabs_nav-header_Locations"]').click()
        location_els = root.find_element(By.CSS_SELECTOR, '[aria-label="provider locations"]').find_elements(By.CSS_SELECTOR, 'li')
        doctor.locations = []
        for location_el in location_els:
            link = location_el.find_element(By.CSS_SELECTOR, 'a')
            divs = location_el.find_elements(By.CSS_SELECTOR, 'div>div')
            location = Location()
            location.name = link.text
            location.link = link.get_attribute('href')
            location.address = divs[0].text
            location.phone = keep_only_numbers(divs[1].find_element(By.CSS_SELECTOR, 'a').get_attribute('href'))
            doctor.locations.append(location)
    except:
        pass
    return doctor

def insert_into_db(doctor: Doctor):
    try:
        conn = psycopg.Connection.connect(dbname=getenv('DB_NAME'),
                                          user=getenv('DB_USER'),
                                          password=getenv('DB_PASS'))
        cur = conn.cursor()
        ins_query = """
        insert into doctors(name, gender, language, link,
                            phone, rating, number_of_ratings, accept_new,
                            employed, specialities, image)
        values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        on conflict("link") do nothing
        returning id
        """
        doc_id_query = """
        select id from doctors where link = %s
        """
        location_query = """
        insert into locations(name, address, phone, link)
        values(%s,%s,%s,%s)
        on conflict("link") do nothing
        returning id
        """
        loc_id_query = """
        select id from locations where link = %s
        """
        loc_doc_query = """
        insert into location_doctor(loc_id, doc_id)
        values(%s,%s)
        on conflict("loc_id", "doc_id") do nothing
        """
        cur.execute(ins_query, (doctor.name, doctor.gender, doctor.languages,
                     doctor.link, doctor.phone, doctor.rating, doctor.reviews,
                     doctor.accept_new, doctor.employed, doctor.specialities, doctor.image))
        if doctor.link != None:
            cur.execute(doc_id_query, [doctor.link])
        doc_id = cur.fetchone()[0]

        if doctor.locations == None:
            doctor.locations = []
        for loc in doctor.locations:
            cur.execute(location_query, (loc.name, loc.address, loc.phone, loc.link))
            if loc.link != None and loc.link != "":
                cur.execute(loc_id_query, [loc.link])
            loc_id = cur.fetchone()[0]
            cur.execute(loc_doc_query, (loc_id, doc_id))
        conn.commit()
    except Exception as e:
        print(e, file=sys.stderr)
    finally:
        cur.close()
        conn.close()

try:
    code = 0
    options = Options()
    options.add_argument('--headless=true')
    driver = webdriver.Chrome(options=options)
    link = sys.argv[1]
    doc = parse_doctor(link, driver)
    print(json.dumps(asdict(doc)))
    insert_into_db(doc)
except Exception as e:
    print(e, file=sys.stderr)
    code = 1
finally:
    driver.close()
    sys.exit(code)
