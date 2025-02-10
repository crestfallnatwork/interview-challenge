-- 9. List all orders where the discount is greater than 0.05
-- This query returns all orders that have atleast one item that recived a discount more than 0.05

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
