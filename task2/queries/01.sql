-- 1. Find the total sale of each region

select region, number_format(sum(profit), 2)
from data
group by region;

-- +----------+-------------------------------+
-- |  region  | NUMBER_FORMAT(SUM(profit), 2) |
-- +----------+-------------------------------+
-- | Central  | 94,793.66                     |
-- | South    | -14,425.92                    |
-- | East     | 91,032.86                     |
-- | West     | 66,623.09                     |
-- |   NULL   | -23,000.29                    |
-- +----------+-------------------------------+
