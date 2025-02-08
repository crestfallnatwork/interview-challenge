# Task 1
Technical Test 1: Web Crawling & Data Extraction
Objective: Build a web crawler to extract and store medical professionals' details from
Andalusia Health.
Task Details:
● Scrape all medical professionals practicing in Andalusia, AL.
● Extract the following details for each doctor:
1. Full Name
2. Doctor Profile URL
3. Address
4. Phone Number
5. Indicator if they have more than one location
6. Whether they accept new patients
7. Whether they are an employed provider
● Store the extracted data in a database (MongoDB or PostgreSQL preferred).
Data Analysis & Reporting
After storing the data, analyze it to generate the following insights:
1. Total number of doctors
2. Total number of doctors with ratings (if ratings are available on the website)
3. Doctors having the same phone number
4. Doctors with more than one location

## Result Files 
`schema.sql` contains the database schema
`queries.sql` contains the database queries, along with results
`queries` contains result of all the queries in csv form
`data.json` contains the extracted dataset
`data.sql` contains the database dump

## Codebase explanation
There are three scripts in total that work in conjunction to scrape data.
- `fetch_links.py`: This script fetches the links of the home pages of all the doctors from the search page
- `fetch_one.py [link]`: This script takes a homepage link as a command line argument and scrapes that page, if database(postgres) creds are in the environment then it also pushes to the entry to database. It always dumps json of the scraped data to stdout. All database operations are idempotent i.e. running this script multiple times have the same effect as running it once.
- `fetch_all.sh`: This bash script takes the output from `fetch_links.py` and runs each link with `fetch_one.py`. All work is done in parallel with 30 workers. Output is slurped into a single JSON object and stored in `data.json`.

