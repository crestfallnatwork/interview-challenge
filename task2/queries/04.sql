-- 4. Idnentify the month with the highest total sales

select Month, Sum(Sales)
from
    (select datetime_format(OrderDate, '%M') as month, Sales
     from data)
group by Month
order by Sum(Sales) desc
limit 1;

-- +-------+--------------------+
-- | Month |     SUM(Sales)     |
-- +-------+--------------------+
-- | April | 384029.19000000006 |
-- +-------+--------------------+
