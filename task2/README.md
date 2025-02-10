The results of the queries and the queries are situated in `queries.sql`. The modified source data is in `data.csv`. Modifications to the header were made by removing blank spaces in header names. `results.csv` contains the results of queries in csv from.  
The program used to make all the queries is [csvq](https://github.com/mithrandie/csvq), a SQL-like query language for csv.  
`results` directory contains results in an easy to read format.
The command to generate `results.csv` is: 
```sh 
csvq --datetime-format '%d/%m/%Y' -s queries.sql -f csv > result.csv  
```
