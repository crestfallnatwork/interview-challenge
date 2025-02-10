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
