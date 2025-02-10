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
