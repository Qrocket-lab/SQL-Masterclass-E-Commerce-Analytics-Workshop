-- SQL MASTERCLASS: FULL 60-TASK ROADMAP SOLUTIONS 

-- TIER 1: BASICS & DDL
-- 1-10: Retrieval
SELECT * FROM Products; -- Task 1
SELECT product_name AS "Item Name" FROM Products; -- Task 2
SELECT * FROM Products WHERE price > 500; -- Task 3
SELECT * FROM Customers ORDER BY registration_date DESC; -- Task 4
SELECT DISTINCT category_id FROM Products; -- Task 5
SELECT * FROM Products WHERE product_name LIKE '%Gaming%'; -- Task 6
SELECT * FROM Orders WHERE order_id IN (501, 502); -- Task 7
SELECT * FROM Products WHERE stock_quantity BETWEEN 10 AND 100; -- Task 8
SELECT * FROM Orders WHERE coupon_id IS NULL; -- Task 9
SELECT * FROM Products ORDER BY price DESC LIMIT 3; -- Task 10

-- 11-20: Schema & Data [cite: 15, 22]
CREATE TABLE Test_Logs (id SERIAL, log TEXT); -- Task 11
ALTER TABLE Customers ADD COLUMN phone_number VARCHAR(20); -- Task 12
DROP TABLE Test_Logs; -- Task 13
TRUNCATE TABLE Order_Items; -- Task 14
-- Note: Constraints (15-17) are defined in database_setup.sql [cite: 47]
INSERT INTO Employees VALUES (3, 'New', 'Hire', 1, 50000, '2025-01-01'); -- Task 18
UPDATE Products SET price = price * 1.10; -- Task 19
DELETE FROM Reviews WHERE rating = 1; -- Task 20

-- TIER 2: AGGREGATIONS & FUNCTIONS [cite: 38, 61]
SELECT COUNT(*) FROM Orders; -- Task 21
SELECT SUM(unit_price * quantity) FROM Order_Items; -- Task 22
SELECT AVG(salary) FROM Employees; -- Task 23
SELECT MIN(price) FROM Products; -- Task 24
SELECT MAX(price) FROM Products; -- Task 25
SELECT category_id, COUNT(*) FROM Products GROUP BY category_id; -- Task 26
SELECT category_id FROM Products GROUP BY category_id HAVING COUNT(*) > 5; -- Task 27
SELECT o.order_id, c.email FROM Orders o INNER JOIN Customers c ON o.customer_id = c.customer_id; -- Task 28
SELECT p.product_name, r.comment FROM Products p LEFT JOIN Reviews r ON p.product_id = r.product_id; -- Task 29
SELECT co.coupon_id, o.order_id FROM Coupons co RIGHT JOIN Orders o ON co.coupon_id = o.coupon_id; -- Task 30
SELECT * FROM Customers FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id; -- Task 31
SELECT CONCAT(first_name, ' ', last_name) FROM Employees; -- Task 32
SELECT SUBSTRING(product_name, 1, 5) FROM Products; -- Task 33
SELECT ROUND(price, 2) FROM Products; -- Task 34
SELECT REPLACE(product_name, 'X', 'Pro') FROM Products; -- Task 35
SELECT COALESCE(coupon_id, 'DEFAULT') FROM Orders; -- Task 36
SELECT product_name, CASE WHEN stock_quantity < 10 THEN 'Restock' ELSE 'OK' END FROM Products; -- Task 37
SELECT CURRENT_DATE; -- Task 38
SELECT order_date + INTERVAL '30 days' FROM Orders; -- Task 39
CREATE VIEW Sales_Summary AS SELECT order_id, order_date FROM Orders; -- Task 40

-- TIER 3: ADVANCED & OPTIMIZATION [cite: 115, 90]
SELECT product_name, ROW_NUMBER() OVER(ORDER BY price DESC) FROM Products; -- Task 41
SELECT last_name, DENSE_RANK() OVER(ORDER BY salary DESC) FROM Employees; -- Task 42
SELECT order_date, LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date) FROM Orders; -- Task 43
SELECT order_date, LEAD(order_date) OVER(PARTITION BY customer_id ORDER BY order_date) FROM Orders; -- Task 44

WITH ActiveUsers AS (SELECT customer_id FROM Orders) 
SELECT * FROM Customers WHERE customer_id IN (SELECT customer_id FROM ActiveUsers); -- Task 45

SELECT e.first_name AS Staff, m.first_name AS Manager 
FROM Employees e JOIN Employees m ON e.manager_id = m.employee_id; -- Task 46 (Self Join)

SELECT p.product_name, c.coupon_id FROM Products p CROSS JOIN Coupons c; -- Task 47

-- Recursive CTE Org Chart [cite: 114, 121]
WITH RECURSIVE OrgChart AS (
    SELECT employee_id, first_name, manager_id, 1 as Level
    FROM Employees WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.first_name, e.manager_id, oc.Level + 1
    FROM Employees e JOIN OrgChart oc ON e.manager_id = oc.employee_id
) SELECT * FROM OrgChart; -- Task 48

-- Transactions & Security [cite: 100, 101]
BEGIN; UPDATE Products SET stock_quantity = stock_quantity - 1 WHERE product_id = 101; COMMIT; -- Task 49
BEGIN; DELETE FROM Products; ROLLBACK; -- Task 50
BEGIN; SAVEPOINT p1; UPDATE Products SET price = 0; ROLLBACK TO p1; COMMIT; -- Task 51

CREATE INDEX idx_email ON Customers(email); -- Task 52
GRANT SELECT ON Products TO public; -- Task 53
REVOKE DELETE ON Orders FROM public; -- Task 54

EXPLAIN ANALYZE SELECT * FROM Products WHERE product_id = 101; -- Task 55 (PostgreSQL syntax)

-- Pivot logic (PostgreSQL style) [cite: 116]
SELECT customer_id, 
       SUM(CASE WHEN EXTRACT(MONTH FROM order_date) = 1 THEN 1 ELSE 0 END) as Jan_Orders
FROM Orders GROUP BY customer_id; -- Task 59
