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
