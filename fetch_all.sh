#!/usr/bin/bash

# Execute things parallely
# adjust jobs jobs depending on machine
# 30 jobs run 30 chrome instances takes >5 gigs of ram.
# store json output in data.json
source venv/bin/activate
export DB_NAME=scrape
export DB_USER=test
export DB_PASS=pass
./fetch_links.py | parallel --jl log --retries 3 --jobs 30 python ./fetch_one.py | jq -s '.' > data.json
