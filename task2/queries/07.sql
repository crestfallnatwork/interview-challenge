-- 7. List the top 3 products with the highest sales

select ProductName, sum(Sales)
from data
group by ProductName
order by sum(Sales) desc
limit 3;

-- +-----------------------------------------------------------------------------+--------------------+
-- |                                 ProductName                                 |     SUM(Sales)     |
-- +-----------------------------------------------------------------------------+--------------------+
-- | Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind |  69013.48000000001 |
-- | Lexmark 4227 Plus Dot Matrix Printer                                        | 61071.729999999996 |
-- | Global Troy™ Executive Leather Low-Back Tilter                              |  50871.20999999999 |
-- +-----------------------------------------------------------------------------+--------------------+
