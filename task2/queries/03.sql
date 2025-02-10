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
