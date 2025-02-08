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


-- 2. List the top 5 customer with the highest total sales

select CustomerID, CustomerName, Sales
from data
order by Sales desc
limit 5;

-- +------------+--------------------+-----------+
-- | CustomerID |    CustomerName    |   Sales   |
-- +------------+--------------------+-----------+
-- | 1733       | Nina Horne Kelly   | 45737.33  |
-- | 553        | Kristine Connolly  | 43046.2   |
-- | 491        | Toni Swanson       | 31670.6   |
-- | 2571       | Rosemary O'Brien   | 29718.53  |
-- | 2670       | Yvonne Mann        | 27587.55  |
-- +------------+--------------------+-----------+


-- 3. Find the average profit for each product category

select ProductCategory, AVG(profit)
from data
group by ProductCategory;

-- +-----------------+---------------------+
-- | ProductCategory |     AVG(profit)     |
-- +-----------------+---------------------+
-- | Office Supplies |   84.46134451029955 |
-- | Furniture       |  127.94709931860464 |
-- | Technology      |  156.55541863201665 |
-- +-----------------+---------------------+


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


-- 5. List all orders where the profit is negative(loss)

select OrderID, Profit
from data
where Profit < 0;

-- +---------+------------+
-- | OrderID |   Profit   |
-- +---------+------------+
-- | 87486   | -337.092   |
-- | 89665   | -61.194    |
-- | 89450   | -4793.004  |
-- | 88174   | -7.58      |
-- | 89083   | -14.80188  |
-- | 87963   | -42.588    |
-- | 9285    | -19.0992   |
-- | 37537   | -308.928   |
-- | 37537   | -1679.76   |
-- | 89961   | -111.4     |
-- | 89961   | -77.03     |
-- | 85858   | -127.008   |
-- | 90337   | -51.5592   |
-- | 90337   | -263.56572 |
-- | 89999   | -181.102   |
-- | 90079   | -407.85    |
-- | 87696   | -473.578   |
-- ...


-- 6. Find the total shipping cost for each ship mode

select ShipMode, Sum(ShippingCost)
from data
group by ShipMode;

-- +----------------+---------------------+
-- |    ShipMode    |  SUM(ShippingCost)  |
-- +----------------+---------------------+
-- | Regular Air    |  10778.659999999954 |
-- | Express Air    |  2131.9700000000007 |
-- | Delivery Truck |  11837.800000000005 |
-- +----------------+---------------------+


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


-- 8 Find the total number of orders placed by each customer segment

select CustomerSegment, count(OrderID)
from (select distinct customersegment, orderid
      from data)
group by CustomerSegment;

-- +-----------------+----------------+
-- | CustomerSegment | COUNT(OrderID) |
-- +-----------------+----------------+
-- | Consumer        |            293 |
-- | Small Business  |            262 |
-- | Home Office     |            334 |
-- | Corporate       |            470 |
-- +-----------------+----------------+


-- 9. List all orders where the discount is greater than 0.05

select distinct OrderID
from data where discount > 0.05;

-- +---------+
-- | OrderID |
-- +---------+
-- | 90539   |
-- | 88174   |
-- | 89083   |
-- | 90853   |
-- | 87963   |
-- | 9285    |
-- | 87940   |
-- | 37537   |
-- | 90079   |
-- | 87696   |
-- | 37987   |
-- | 30785   |
-- | 88296   |
-- | 87463   |
-- | 86092   |
-- | 85850   |
-- | 86356   |
-- | 86951   |
-- ...


-- 10. Find the total profit for each state

select StateOrProvince, sum(Profit)
from data
group by StateOrProvince;

-- +-----------------------+---------------------+
-- |    StateOrProvince    |     SUM(Profit)     |
-- +-----------------------+---------------------+
-- | Mississippi           |          -529.91495 |
-- | Illinois              |  12321.579311999994 |
-- | Arkansas              |          -1184.7472 |
-- | Missouri              |  2123.2119000000002 |
-- | Indiana               |   -976.949505000001 |
-- | Colorado              |   6965.462660000001 |
-- | Tennessee             | -1603.4634000000008 |
-- | Washington            |  116.21885000000084 |
-- | Texas                 |         27288.38666 |
-- | Georgia               |   8645.207413699996 |
-- | New York              |  27611.943318600006 |
-- | Minnesota             |          6932.44586 |
-- | Pennsylvania          |  -1556.182524599999 |
-- | California            |  36187.568192000006 |
-- | Oklahoma              |          2555.98952 |
-- | North Carolina        | -19337.166839999983 |
-- | Iowa                  |   1262.430580000001 |
-- | New Jersey            |   770.9086880000001 |
-- | Virginia              | -1748.5516999999995 |
-- | New Mexico            |          4215.91948 |
-- | Kentucky              |  -1982.645000000001 |
-- | Louisiana             |           710.12542 |
-- | Florida               |   322.0738399999999 |
-- | Ohio                  |  23410.842026000006 |
-- | Michigan              |  12307.551891600004 |
-- | Nebraska              |          4675.60033 |
-- | Oregon                |  15291.572600000001 |
-- | Idaho                 |           6848.3533 |
-- | Utah                  |  3931.8369799999987 |
-- | New Hampshire         |  3611.0573999999997 |
-- | Alabama               | -2418.0565999999994 |
-- | Massachusetts         |          5293.78398 |
-- | South Dakota          |            431.1862 |
-- | South Carolina        |         1695.783237 |
-- | Wisconsin             |  3986.4100599999974 |
-- | Kansas                |          2725.77636 |
-- | Connecticut           |           -529.1063 |
-- | Maryland              |  1336.0164599999991 |
-- | Maine                 |   3169.462893000001 |
-- | Arizona               |  3909.7538320000003 |
-- | Vermont               |   530.1497800000002 |
-- | Montana               |        -13759.20549 |
-- | Nevada                |  3788.8289959999997 |
-- | North Dakota          |  3012.1560999999997 |
-- | Wyoming               |             735.225 |
-- | District of Columbia  |  11677.363099999999 |
-- | Rhode Island          |   5073.001399999999 |
-- | West Virginia         |   4771.463824999999 |
-- | Delaware              |            406.7418 |
-- +-----------------------+---------------------+
