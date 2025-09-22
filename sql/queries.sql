-- =====================================
-- Reverse Logistics & Loss Analysis
-- SQL Queries for Orders & Returns Data
-- =====================================

-- 1. Total Orders and Total Returns
SELECT 
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Flag = 'Yes' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(100.0 * SUM(CASE WHEN Return_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_percent
FROM Orders;


-- 2. Vendor-wise Return Rate
SELECT 
    Vendor,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Flag = 'Yes' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(100.0 * SUM(CASE WHEN Return_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_percent
FROM Orders
GROUP BY Vendor
ORDER BY return_rate_percent DESC;


-- 3. Return Reasons Distribution with Financial Impact
SELECT 
    Return_Reason,
    COUNT(*) AS total_returns,
    SUM(Return_Cost) AS total_return_cost
FROM Returns
GROUP BY Return_Reason
ORDER BY total_return_cost DESC;


-- 4. Monthly Orders vs Returns Trend
SELECT 
    strftime('%Y-%m', Order_Date) AS month,   -- use FORMAT(Order_Date, 'yyyy-MM') in SQL Server
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Return_Flag = 'Yes' THEN 1 ELSE 0 END) AS total_returns
FROM Orders
GROUP BY strftime('%Y-%m', Order_Date)
ORDER BY month;


-- 5. Carrier-wise Average Resolution Time
SELECT 
    Carrier,
    ROUND(AVG(Resolution_Time_Days), 2) AS avg_resolution_time_days
FROM Returns
GROUP BY Carrier
ORDER BY avg_resolution_time_days DESC;


-- 6. Top 5 Vendors by Return Cost
SELECT 
    Vendor,
    SUM(Returns.Return_Cost) AS total_return_cost
FROM Orders
JOIN Returns
    ON Orders.Order_ID = Returns.Order_ID
GROUP BY Vendor
ORDER BY total_return_cost DESC
LIMIT 5;
