-- Create sales table
CREATE TABLE sales (
    Order_ID INT PRIMARY KEY,
    Product VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    Total_Sales DECIMAL(10,2),
    Date DATE,
    Customer_Region VARCHAR(50)
);

-- Insert data (Replace with actual CSV import command)
-- LOAD DATA INFILE 'sales_data.csv' INTO TABLE sales
-- FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Query 1: Find the best-selling products
SELECT Product, SUM(Quantity) AS Total_Quantity_Sold
FROM sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

-- Query 2: Monthly Revenue Trends
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, SUM(Total_Sales) AS Monthly_Revenue
FROM sales
GROUP BY Month
ORDER BY Month;

-- Query 3: Top Customer Regions by Sales
SELECT Customer_Region, SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Customer_Region
ORDER BY Total_Sales DESC;
