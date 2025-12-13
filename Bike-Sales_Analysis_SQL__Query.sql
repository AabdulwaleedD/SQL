-- 1. TOTAL NUMBER OF PRODUCTS BY PRODUCT NAME
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_products_sold
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_products_sold DESC;

-- CUSTOMERS WITH THE HIGHEST NUMBER OF ORDERS
SELECT 
    c.customer_id,
    CONCAT(first_name, ' ', last_name) AS Fullname,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, CONCAT(first_name, ' ', last_name)
ORDER BY total_orders DESC
LIMIT 10;

-- TOTAL AMOUNT SPENT BY CUSTOMERS WITH THE HIGHEST NUMBER OF ORDERS
SELECT 
    c.customer_id,
    CONCAT(first_name, ' ', last_name) AS Fullname,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.list_price) AS total_amount_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, CONCAT(first_name, ' ', last_name)
ORDER BY total_orders DESC, total_amount_spent DESC
LIMIT 10;

-- STATE WITH THE HIGHEST NUMBER OF ORDERS
SELECT 
    c.state,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY total_orders DESC
LIMIT 10;

-- PRODUCT WITH THE HIGHEST NUMBER OF SALES
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 10;

-- HIGH PERFORMING PRODUCT BRAND
SELECT 
    b.brand_name,
    SUM(oi.quantity * oi.list_price) AS total_sales_amount
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
JOIN brands b 
    ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY total_sales_amount DESC
LIMIT 10;

-- BRAND RANKING (ALL BRANDS)
SELECT 
    b.brand_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.list_price) AS total_sales_amount
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
JOIN brands b 
    ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY total_sales_amount DESC;

-- ITEM WITH HIGHEST PRICE + BRAND NAME
SELECT 
    p.product_name,
    b.brand_name,
    p.list_price
FROM products p
JOIN brands b 
    ON p.brand_id = b.brand_id
WHERE p.list_price = (SELECT MAX(list_price) FROM products);





