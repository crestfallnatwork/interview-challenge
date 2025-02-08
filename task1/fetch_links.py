#!venv/bin/python
#
# Script fetches links to all the doctors present in the search url
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options


search_page_url = 'https://www.andalusiahealth.com/find-a-doctor/results?address=andalusia&defaultSort=true'

class presence_of_located_elements_shadow_root(object):
  def __init__(self, root, locator):
    self.locator = locator
    self.root = root

  def __call__(self, driver):
    elements = root.find_elements(*self.locator)   # Finding the referenced element
    return elements

options = Options()
options.add_argument('--headless=true')
driver = webdriver.Chrome(options=options)
driver.get(search_page_url)
root = driver.find_element(By.CSS_SELECTOR, 'section#loyal-search').shadow_root
els = WebDriverWait(driver, 8).until(presence_of_located_elements_shadow_root(root, (By.CSS_SELECTOR, 'a[data-testref="provider-name-link"]')))
for link in els:
    print(link.get_attribute("href"))
