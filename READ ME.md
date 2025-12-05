
````sql
🚀 SQL Masterclass: E-Commerce Analytics Workshop

This hands-on guide takes you from foundational SQL commands to advanced analytical techniques like Window Functions and Common Table Expressions (CTEs), using a consistent e-commerce dataset.

## 1. Database Setup: The E-Commerce Schema

We will use three tables: **Customers**, **Products**, and **Orders**. Run these commands in your SQL environment (e.g., PostgreSQL, MySQL, SQLite) to create the tables and populate them with mock data.

### 1.1. Schema Creation

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- 3. Orders Table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES Customers(customer_id),
    product_id INTEGER REFERENCES Products(product_id),
    order_date DATE,
    quantity INTEGER,
    order_total DECIMAL(10, 2)
);

### 1.2. Mock Data Insertion

-- Mock Data for Customers
INSERT INTO Customers VALUES
(101, 'Alice', 'Smith', 'alice@example.com', '2023-01-15'),
(102, 'Bob', 'Johnson', 'bob@example.com', '2023-02-20'),
(103, 'Charlie', 'Brown', 'charlie@example.com', '2023-03-01'),
(104, 'Diana', 'Prince', 'diana@example.com', '2023-04-10'),
(105, 'Evan', 'Wright', 'evan@example.com', '2023-05-25');

-- Mock Data for Products
INSERT INTO Products VALUES
(1, 'Laptop Pro X', 'Electronics', 1200.00),
(2, 'Mechanical Keyboard', 'Accessories', 150.00),
(3, 'Wireless Mouse', 'Accessories', 50.00),
(4, 'Gaming Chair Z', 'Furniture', 350.00),
(5, '4K Monitor', 'Electronics', 450.00);

-- Mock Data for Orders (Multiple entries per customer/product)
INSERT INTO Orders VALUES
(1001, 101, 1, '2023-01-20', 1, 1200.00), -- Alice: Laptop (1st)
(1002, 102, 2, '2023-02-25', 2, 300.00),  -- Bob: Keyboard (1st)
(1003, 101, 3, '2023-03-05', 1, 50.00),   -- Alice: Mouse (2nd)
(1004, 103, 4, '2023-03-10', 1, 350.00),  -- Charlie: Chair (1st)
(1005, 104, 5, '2023-04-15', 1, 450.00),  -- Diana: Monitor (1st)
(1006, 102, 3, '2023-04-20', 3, 150.00),  -- Bob: Mouse (2nd)
(1007, 105, 1, '2023-06-01', 1, 1200.00), -- Evan: Laptop (1st)
(1008, 101, 5, '2023-06-10', 2, 900.00),  -- Alice: Monitor (3rd)
(1009, 103, 2, '2023-07-01', 1, 150.00),  -- Charlie: Keyboard (2nd)
(1010, 102, 4, '2023-07-15', 1, 350.00);  -- Bob: Chair (3rd)

---

## 2. Tier 1: Beginner Fundamentals (SELECT, WHERE, ORDER BY)

These tasks cover the fundamental retrieval and filtering of data.

**#Task 1**
**Goal:** Retrieve All Data: Select all columns and rows from the **Products** table.
```sql
SELECT * FROM Products;
````

**\#Task 2**
**Goal:** Filter by Price: Find the **product\_name** and **price** of products costing more than $500.

```sql
SELECT product_name, price FROM Products WHERE price > 500.00;
```

**\#Task 3**
**Goal:** Filter by Category: Find all orders placed for products in the 'Electronics' category. (Requires a simple JOIN).

```sql
SELECT T1.* FROM Orders AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T2.category = 'Electronics';
```

**\#Task 4**
**Goal:** Ordering Results: List all customers, ordered by their **registration\_date** from oldest to newest.

```sql
SELECT * FROM Customers ORDER BY registration_date ASC;
```

**\#Task 5**
**Goal:** Compound Condition: Find the names of products that are in the 'Accessories' category AND cost less than $100.

```sql
SELECT product_name FROM Products WHERE category = 'Accessories' AND price < 100.00;
```

-----

## 3\. Tier 2: Intermediate Aggregation and Joins (GROUP BY, HAVING)

These tasks introduce grouping, calculating metrics, and filtering the results based on those metrics.

**\#Task 6**
**Goal:** Total Sales Per Customer: Calculate the total lifetime **order\_total** for each customer, displaying their **customer\_id** and the total spent.

```sql
SELECT customer_id, SUM(order_total) AS lifetime_spent FROM Orders GROUP BY customer_id;
```

**\#Task 7**
**Goal:** Category Performance: Find the total number of items sold (quantity) for each product **category**.

```sql
SELECT T2.category, SUM(T1.quantity) AS total_units_sold FROM Orders AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id GROUP BY T2.category;
```

**\#Task 8**
**Goal:** High-Value Customers (HAVING): Find the **customer\_id** of customers who have placed at least **3 orders**. (The **HAVING** clause is essential here).

```sql
SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(order_id) >= 3;
```

**\#Task 9**
**Goal:** Power Shoppers (Chat Problem): Find customers who have placed at least 3 orders AND have a total spending greater than $500. Display their name and the metrics.

```sql
SELECT 
    T1.first_name, 
    T1.last_name, 
    COUNT(T2.order_id) AS total_orders, 
    SUM(T2.order_total) AS total_spending 
FROM Customers AS T1 
JOIN Orders AS T2 
    ON T1.customer_id = T2.customer_id 
GROUP BY 
    T1.customer_id, T1.first_name, T1.last_name 
HAVING 
    COUNT(T2.order_id) >= 3 AND SUM(T2.order_total) > 500.00 
ORDER BY 
    total_spending DESC;
```

**\#Task 10**
**Goal:** Unordered Products: Find the names of products that have never been included in any order. (Hint: Use a **LEFT JOIN** and check for NULLs).

```sql
SELECT T1.product_name 
FROM Products AS T1 
LEFT JOIN Orders AS T2 
    ON T1.product_id = T2.product_id 
GROUP BY T1.product_name 
HAVING COUNT(T2.order_id) = 0;
```

-----

## 4\. Tier 3: Advanced Analytics (Window Functions and CTEs)

These tasks use advanced features for complex reporting and sequential analysis.

**\#Challenge 11: First Order Date (Window Function)**
**Task:** Retrieve all customer names and every order they've ever placed. Additionally, include the **customer's very first order date** as a separate column on **every row**.

```sql
SELECT 
    T1.first_name, 
    T1.last_name, 
    T2.order_date, 
    T2.order_total, 
    MIN(T2.order_date) OVER (PARTITION BY T1.customer_id) AS first_order_date 
FROM Customers AS T1 
JOIN Orders AS T2 
    ON T1.customer_id = T2.customer_id 
ORDER BY 
    T1.customer_id, T2.order_date;
```

**\#Challenge 12: Order Sequence (Window Function)**
**Task:** For every order, assign a sequence number (1, 2, 3...) indicating if it was the customer's first, second, or third purchase.

```sql
SELECT 
    T1.first_name, 
    T2.order_date, 
    T2.order_total, 
    ROW_NUMBER() OVER (PARTITION BY T1.customer_id ORDER BY T2.order_date ASC) AS order_sequence 
FROM Customers AS T1 
JOIN Orders AS T2 
    ON T1.customer_id = T2.customer_id 
ORDER BY 
    T1.customer_id, order_sequence;
```

**\#Challenge 13: Customer Quartiles (CTE and Window Function)**
**Task:** Identify the top 25% of customers based on their total lifetime spending.

```sql
WITH CustomerSpending AS (
    SELECT 
        customer_id, 
        SUM(order_total) AS total_spent 
    FROM Orders 
    GROUP BY customer_id
), 
RankedCustomers AS (
    SELECT 
        customer_id, 
        total_spent, 
        NTILE(4) OVER (ORDER BY total_spent DESC) as quartile 
    FROM CustomerSpending 
)
SELECT 
    T1.first_name, 
    T1.last_name, 
    T2.total_spent 
FROM Customers AS T1 
JOIN RankedCustomers AS T2 
    ON T1.customer_id = T2.customer_id 
WHERE 
    T2.quartile = 1 
ORDER BY 
    T2.total_spent DESC;
```

**\#Challenge 14: Products with Average Price (CTE)**
**Task:** Find all products whose price is above the overall average product price. Use a CTE for clarity.

```sql
WITH AvgPrice AS (
    SELECT AVG(price) AS overall_average 
    FROM Products
)
SELECT 
    product_name, 
    price 
FROM Products 
WHERE 
    price > (SELECT overall_average FROM AvgPrice);
```

**\#Challenge 15: Chained CTEs (Multi-Stage Analysis)**
**Task:** Find the total number of orders placed by customers who registered in the first quarter of 2023 (Jan 1 - Mar 31).

```sql
WITH Q1_Customers AS (
    SELECT customer_id 
    FROM Customers 
    WHERE registration_date BETWEEN '2023-01-01' AND '2023-03-31'
), 
Q1_Orders AS (
    SELECT T2.order_id 
    FROM Q1_Customers AS T1 
    JOIN Orders AS T2 
        ON T1.customer_id = T2.customer_id
)
SELECT 
    COUNT(order_id) AS total_orders_by_q1_registrants 
FROM Q1_Orders;
```

```
```
