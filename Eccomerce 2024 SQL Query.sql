Select * From ecommerce;

SELECT COUNT(DISTINCT OrderID) AS Total_Orders
From ecommerce;

-- Total revenue
SELECT SUM(TotalAmount) AS Total_Revenue
FROM ecommerce;

-- Average order value
SELECT CAST(AVG(TotalAmount) AS decimal(10,2)) AS avg_order_value
FROM ecommerce;

-- PRODUCT & CATEGORY ANALYSIS
-- Revenue by category
SELECT Category,
       SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY Category
ORDER BY revenue DESC;

-- Top-selling products (by revenue)
SELECT Product,
       SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY Product
ORDER BY revenue DESC;

-- Products by quantity sold
SELECT Product,
       SUM(Quantity) AS total_units
FROM ecommerce
GROUP BY Product
ORDER BY total_units DESC;

-- Revenue by brand
SELECT Brand,
       SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY Brand
ORDER BY revenue DESC;

-- Platform performance
SELECT Platform,
       COUNT(DISTINCT OrderID) AS orders,
       SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY Platform
ORDER BY revenue DESC;

-- Sales by city
SELECT City,
       SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY City
ORDER BY revenue DESC;

-- Average rating by product
SELECT Product,
       AVG(Rating) AS avg_rating
FROM ecommerce
GROUP BY Product
ORDER BY avg_rating DESC;

-- Reviews vs revenue
SELECT Product,
       SUM(Reviews) AS total_reviews,
       SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY Product;

-- Sales by month
SELECT 
    YEAR(OrderDate) AS year,
    MONTH(OrderDate) AS month,
    SUM(TotalAmount) AS revenue
FROM ecommerce
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY year, month;





