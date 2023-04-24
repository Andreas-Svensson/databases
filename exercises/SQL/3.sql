-- ###################
-- ### Exercise 3A ###
-- ###################

DECLARE @unique_products AS INT = (SELECT COUNT(DISTINCT ID) FROM Company.Products)

SELECT
	COUNT(DISTINCT p.ID) AS 'Unique Products',
	FORMAT(CAST(COUNT(DISTINCT p.ID) AS FLOAT) / @unique_products * 100, '#.00') AS 'Amount Unique Products (%)'
FROM
	Company.Products p
	JOIN Company.Order_details od ON p.ID = od.ProductID
	JOIN Company.Orders o ON od.OrderID = o.ID
WHERE
	o.ShipCity = 'London'

-->

-- Unique Products        Amount Unique Products (%)
-- 41                     53.25



-- ###################
-- ### Exercise 3B ###
-- ###################

SELECT TOP 1
	o.ShipCity AS 'City',
	COUNT(o.ShipCity) AS 'Amount Orders'
FROM
	Company.Products p
	JOIN Company.Order_details od ON p.ID = od.ProductID
	JOIN Company.Orders o ON od.OrderID = o.ID
GROUP BY
	o.ShipCity
ORDER BY
	COUNT(o.ShipCity) DESC

-->

-- City        Amount Orders
-- Boise       69



-- ###################
-- ### Exercise 3C ###
-- ###################



-->
