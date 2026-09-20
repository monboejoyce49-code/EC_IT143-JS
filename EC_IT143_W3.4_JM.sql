/* =========================================================
   EC_IT143_W3.4 - AdventureWorks Create Answers
   Student: Joyce S Monboe
   Date: 2026-05-31
   Database: AdventureWorks2022
   Estimated Runtime: < 5 minutes
========================================================= */

USE AdventureWorks2022;
GO

-- =========================================================
-- Q1 (Author: Joyce Monboe)
-- Marginal Complexity
-- Question: Top 10 most expensive products by list price
-- =========================================================

SELECT TOP 10
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO


-- =========================================================
-- Q2 (Author: Joyce Monboe)
-- Marginal Complexity
-- Question: Products with lowest list price
-- =========================================================

SELECT TOP 10
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;
GO


-- =========================================================
-- Q3 (Author: Joyce Monboe)
-- Moderate Complexity
-- Question: Customers with highest number of orders
-- =========================================================

SELECT TOP 10
    CustomerID,
    COUNT(SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY TotalOrders DESC;
GO


-- =========================================================
-- Q4 (Author: Joyce Monboe)
-- Moderate Complexity
-- Question: Sales by product category and subcategory
-- =========================================================

SELECT 
    pc.Name AS Category,
    psc.Name AS SubCategory,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name, psc.Name
ORDER BY TotalRevenue DESC;
GO


-- =========================================================
-- Q5 (Author: Joyce Monboe)
-- Increased Complexity
-- Question: Bicycle sales trends in 2012 by month and territory
-- =========================================================

SELECT 
    YEAR(soh.OrderDate) AS SalesYear,
    MONTH(soh.OrderDate) AS SalesMonth,
    st.Name AS Territory,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE psc.Name LIKE '%Bike%'
AND YEAR(soh.OrderDate) = 2012
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate), st.Name
ORDER BY SalesMonth;
GO


-- =========================================================
-- Q6 (Author: Joyce Monboe)
-- Increased Complexity
-- Question: Mountain bike sales by color, size, and quarter
-- =========================================================

SELECT 
    p.Color,
    p.Size,
    DATEPART(QUARTER, soh.OrderDate) AS SalesQuarter,
    SUM(sod.OrderQty) AS TotalQuantity,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh
    ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE psc.Name LIKE '%Mountain Bike%'
GROUP BY p.Color, p.Size, DATEPART(QUARTER, soh.OrderDate)
ORDER BY SalesQuarter;
GO


-- =========================================================
-- Q7 (Author: Joyce Monboe)
-- Metadata Question
-- Find tables containing ProductID column
-- =========================================================

SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID';
GO


-- =========================================================
-- Q8 (Author: Joyce Monboe)
-- Metadata Question
-- Find tables with FirstName or LastName columns
-- =========================================================

SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('FirstName', 'LastName');
GO