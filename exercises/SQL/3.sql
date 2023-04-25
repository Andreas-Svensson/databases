-- ###################
-- ### Exercise 3A ###
-- ###################

DECLARE @unique_products AS INT = (SELECT COUNT(DISTINCT ID) FROM Company.Products);

SELECT
	COUNT(DISTINCT od.ProductID) AS 'Unique Products',
	FORMAT(CAST(COUNT(DISTINCT od.ProductID) AS FLOAT) / @unique_products * 100, '#.00') AS 'Amount Unique Products (%)'
FROM
	Company.Order_Details od
	JOIN Company.Orders o ON od.OrderID = o.ID
WHERE
	o.ShipCity = 'London';

-->

-- Unique Products        Amount Unique Products (%)
-- 41                     53.25



-- ###################
-- ### Exercise 3B ###
-- ###################

SELECT TOP 1
	o.ShipCity AS 'City',
	COUNT(DISTINCT p.ID) AS 'Amount Orders'
FROM
	Company.Products p
	JOIN Company.Order_details od ON p.ID = od.ProductID
	JOIN Company.Orders o ON od.OrderID = o.ID
GROUP BY
	o.ShipCity
ORDER BY
	[Amount Orders] DESC;

-->

-- City        Amount Orders
-- Boise       45



-- ###################
-- ### Exercise 3C ###
-- ###################

SELECT
	SUM(od.Quantity * od.UnitPrice) AS 'Total Value of Discontinued Units Sold to Germany'
FROM
	Company.Products p
	JOIN Company.Order_Details od ON p.ID = od.ProductId
	JOIN Company.Orders o ON od.OrderID = o.ID
WHERE
	o.ShipCountry = 'Germany' AND p.Discontinued = 1;

-->

-- Total Value of Discontinued Units Sold to Germany
-- 12047.5



-- ###################
-- ### Exercise 3D ###
-- ###################

SELECT TOP 1
	c.CategoryName AS 'Category',
	SUM(p.UnitsInStock) AS 'In Stock'
FROM
	Company.Products p
	JOIN Company.Categories c ON p.CategoryId = c.ID
GROUP BY
	c.CategoryName
ORDER BY
	[In Stock] DESC;

-->

-- Category      In Stock
-- Seafood       701



-- ###################
-- ### Exercise 3E ###
-- ###################

SELECT TOP 1
	s.CompanyName AS 'Supplier',
	SUM(od.Quantity) AS 'Products Sold'
FROM
	Company.Orders o
	JOIN Company.Order_Details od ON o.ID = od.OrderID
	JOIN Company.Products p ON od.ProductID = p.ID
	JOIN Company.Suppliers s ON p.SupplierID = s.ID
WHERE
	o.OrderDate BETWEEN '2013-06-01' AND '2013-08-31' -- arbitrarily defined summer as June, July,  August
GROUP BY
	s.CompanyName,
	s.ID -- include ID to deal with companies having the same name
ORDER BY
	[Products Sold] DESC;

-->

-- Supplier                                 Products Sold
-- Plutzer Lebensmittelgroßmärkte AG        488

