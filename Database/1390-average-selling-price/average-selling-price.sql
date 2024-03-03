-- This part creates a Common Table Expression (CTE) named `priced_units`
WITH priced_units AS (
  -- Select distinct product_id, purchase_date, and units from UnitsSold table
  SELECT DISTINCT p.product_id,
         u.purchase_date,
         -- Subquery to find the price for each purchase_date
         (
           SELECT p.price
           FROM Prices p
           WHERE p.product_id = u.product_id
             AND u.purchase_date BETWEEN p.start_date AND p.end_date
         ) AS Price,
         u.units
  -- Join UnitsSold and Prices tables on product_id (LEFT JOIN used)
  FROM Prices p
  LEFT JOIN UnitsSold u ON p.product_id = u.product_id
)

-- Select product_id and calculate the average price
SELECT product_id,
  -- CASE statement to handle NULL values in average price calculation
  CASE
    WHEN ROUND(SUM(Price * units) / SUM(units), 2) IS NULL THEN 0 -- If average price is NULL, set to 0
    ELSE ROUND(SUM(Price * units) / SUM(units), 2) -- Otherwise, round the average price to 2 decimal places
  END AS average_price
FROM priced_units
GROUP BY product_id
ORDER BY product_id;
