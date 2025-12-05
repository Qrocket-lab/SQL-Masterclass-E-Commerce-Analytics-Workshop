-- SQL Masterclass: E-Commerce Analytics Workshop - Verified Solutions

-----------------------------------------------------
-- TIER 1: BEGINNER FUNDAMENTALS
-----------------------------------------------------

-- #Task 1: Retrieve All Data from Products
SELECT * FROM Products;

-- #Task 2: Filter by Price > $500
SELECT product_name, price 
FROM Products 
WHERE price > 500.00;

-- #Task 3: Filter by Category 'Electronics' (JOIN)
SELECT T1.* FROM Orders AS T1 
JOIN Products AS T2 ON T1.product_id = T2.product_id 
WHERE T2.category = 'Electronics';

-- #Task 4: Ordering Results by Registration Date
SELECT * FROM Customers 
ORDER BY registration_date ASC;

-- #Task 5: Compound Condition (Accessories AND price < $100)
SELECT product_name 
FROM Products 
WHERE category = 'Accessories' AND price < 100.00;

-----------------------------------------------------
-- TIER 2: INTERMEDIATE AGGREGATION AND JOINS
-----------------------------------------------------

-- #Task 6: Total Sales Per Customer
SELECT customer_id, SUM(order_total) AS lifetime_spent 
FROM Orders 
GROUP BY customer_id;

-- #Task 7: Category Performance (Total units sold per category)
SELECT T2.category, SUM(T1.quantity) AS total_units_sold 
FROM Orders AS T1 
JOIN Products AS T2 ON T1.product_id = T2.product_id 
GROUP BY T2.category;

-- #Task 8: High-Value Customers (HAVING Count >= 3)
SELECT customer_id 
FROM Orders 
GROUP BY customer_id 
HAVING COUNT(order_id) >= 3;

-- #Task 9: Power Shoppers (Orders >= 3 AND Spending > $500)
SELECT 
    T1.first_name, 
    T1.last_name, 
    COUNT(T2.order_id) AS total_orders, 
    SUM(T2.order_total) AS total_spending 
FROM Customers AS T1 
JOIN Orders AS T2 ON T1.customer_id = T2.customer_id 
GROUP BY T1.customer_id, T1.first_name, T1.last_name 
HAVING COUNT(T2.order_id) >= 3 AND SUM(T2.order_total) > 500.00 
ORDER BY total_spending DESC;

-- #Task 10: Unordered Products (LEFT JOIN / COUNT = 0)
SELECT T1.product_name 
FROM Products AS T1 
LEFT JOIN Orders AS T2 ON T1.product_id = T2.product_id 
GROUP BY T1.product_name 
HAVING COUNT(T2.order_id) = 0;

-----------------------------------------------------
-- TIER 3: ADVANCED ANALYTICS (WINDOW FUNCTIONS & CTEs)
-----------------------------------------------------

-- #Challenge 11: First Order Date (Window Function)
SELECT 
    T1.first_name, 
    T1.last_name, 
    T2.order_date, 
    T2.order_total, 
    MIN(T2.order_date) OVER (PARTITION BY T1.customer_id) AS first_order_date -- Window Function
FROM Customers AS T1 
JOIN Orders AS T2 ON T1.customer_id = T2.customer_id 
ORDER BY T1.customer_id, T2.order_date;

-- #Challenge 12: Order Sequence (ROW_NUMBER)
SELECT 
    T1.first_name, 
    T2.order_date, 
    T2.order_total, 
    ROW_NUMBER() OVER (PARTITION BY T1.customer_id ORDER BY T2.order_date ASC) AS order_sequence -- Window Function
FROM Customers AS T1 
JOIN Orders AS T2 ON T1.customer_id = T2.customer_id 
ORDER BY T1.customer_id, order_sequence;

-- #Challenge 13: Customer Quartiles (CTE and NTILE)
WITH CustomerSpending AS (
    -- Stage 1: Calculate total spending per customer
    SELECT customer_id, SUM(order_total) AS total_spent 
    FROM Orders 
    GROUP BY customer_id
), 
RankedCustomers AS (
    -- Stage 2: Rank customers into quartiles (1 = Top 25%)
    SELECT 
        customer_id, 
        total_spent, 
        NTILE(4) OVER (ORDER BY total_spent DESC) as quartile -- Window Function
    FROM CustomerSpending 
)
SELECT 
    T1.first_name, 
    T1.last_name, 
    T2.total_spent 
FROM Customers AS T1 
JOIN RankedCustomers AS T2 ON T1.customer_id = T2.customer_id 
WHERE T2.quartile = 1 -- Filter for the highest spending quartile
ORDER BY T2.total_spent DESC;

-- #Challenge 14: Products with Above Average Price (CTE)
WITH AvgPrice AS (
    -- Stage 1: Calculate the overall average price
    SELECT AVG(price) AS overall_average 
    FROM Products
)
-- Main Query: Filter products based on the CTE result
SELECT product_name, price 
FROM Products 
WHERE price > (SELECT overall_average FROM AvgPrice);

-- #Challenge 15: Chained CTEs (Multi-Stage Analysis)
WITH Q1_Customers AS (
    -- Stage 1: Identify customers who registered in Q1 2023
    SELECT customer_id 
    FROM Customers 
    WHERE registration_date BETWEEN '2023-01-01' AND '2023-03-31'
), 
Q1_Orders AS (
    -- Stage 2: Get all orders for those Q1 customers
    SELECT T2.order_id 
    FROM Q1_Customers AS T1 
    JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
)
-- Final Query: Count the total number of orders
SELECT COUNT(order_id) AS total_orders_by_q1_registrants 
FROM Q1_Orders;
