-- Create a new database
CREATE DATABASE superstore_db;
USE superstore_db;

-- Create table structure
CREATE TABLE superstore (
    RowID INT,
    OrderID VARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(50),
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Region VARCHAR(50),
    ProductID VARCHAR(50),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

USE superstore_db;
SHOW TABLES;


ALTER TABLE superstore_sales_dataset RENAME TO superstore;

SHOW TABLES;

SELECT COUNT(*) FROM superstore;

-- Data Sample
SELECT * 
FROM superstore
LIMIT 10;

-- Total Records.

SELECT COUNT(*) AS total_rows 
FROM superstore;

-- Profit Margin by Category.

SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY Category;

-- Profit Margin by Sub-Category.

SELECT `Sub-Category`,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit,
       ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Percent
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Profit_Margin_Percent ASC;

-- Regional Performance.

SELECT Region,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Monthly Profit Trend.

SELECT DATE_FORMAT('OrderDate', '%Y-%m') AS Month,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Month
ORDER BY Month;














