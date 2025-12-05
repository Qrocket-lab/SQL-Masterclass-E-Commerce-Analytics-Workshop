# 📝 E-Commerce SQL Challenges

Use the tables created in `database_setup.sql` to solve the following problems. The solutions are provided in `solutions.sql`.

---

## Tier 1: Beginner Fundamentals (SELECT, WHERE, ORDER BY)

| # | Goal | Hint |
| :--- | :--- | :--- |
| **1** | **Retrieve All Data:** Select all columns and rows from the **Products** table. | `SELECT *` |
| **2** | **Filter by Price:** Find the **product_name** and **price** of products costing more than $500. | Use a `WHERE` clause. |
| **3** | **Filter by Category (JOIN):** Find all orders placed for products in the 'Electronics' category. | Requires a simple `JOIN` between `Orders` and `Products`. |
| **4** | **Ordering Results:** List all customers, ordered by their **registration_date** from oldest to newest. | Use `ORDER BY ... ASC`. |
| **5** | **Compound Condition:** Find the names of products that are in the 'Accessories' category **AND** cost less than $100. | Use `AND` in your `WHERE` clause. |

---

## Tier 2: Intermediate Aggregation and Joins (GROUP BY, HAVING)

| # | Goal | Hint |
| :--- | :--- | :--- |
| **6** | **Total Sales Per Customer:** Calculate the total lifetime **order_total** for each customer, displaying their `customer_id` and the total spent. | Use `SUM()` and `GROUP BY`. |
| **7** | **Category Performance:** Find the total number of items sold (**quantity**) for each product **category**. | Requires `JOIN`, `SUM()`, and `GROUP BY` the category name. |
| **8** | **High-Value Customers (HAVING):** Find the `customer_id` of customers who have placed at least **3 orders**. | Use `COUNT()` and the `HAVING` clause to filter the grouped result. |
| **9** | **Power Shoppers (JOIN/HAVING):** Find customers who have placed at least 3 orders **AND** have a total spending greater than $500. Display their name and the metrics. | This requires a `JOIN` to get names, and a `HAVING` clause with two conditions. |
| **10** | **Unordered Products:** Find the names of products that have **never been included** in any order. | Use a `LEFT JOIN` from `Products` to `Orders` and filter where the `order_id` is `NULL` (or check the count). |

---

## Tier 3: Advanced Analytics (Window Functions and CTEs)

| # | Challenge | Technique |
| :--- | :--- | :--- |
| **11** | **First Order Date:** Retrieve every order a customer has placed, but include the customer's **very first order date** as a separate column on **every row**. | Use `MIN() OVER (PARTITION BY customer_id)`. |
| **12** | **Order Sequence:** For every order, assign a sequence number (1, 2, 3...) indicating if it was the customer's first, second, or third purchase. | Use `ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date)`. |
| **13** | **Customer Quartiles:** Identify the **top 25%** of customers based on their total lifetime spending. | Use a **CTE** to calculate total spending, then use `NTILE(4)` to categorize them. Filter for `quartile = 1`. |
| **14** | **Products Above Average Price:** Find all products whose price is above the overall average product price. | Use a **CTE** to calculate the average price, and then use that average in the main query's `WHERE` clause. |
| **15** | **Chained CTEs:** Find the total number of orders placed by customers who registered in the **first quarter of 2023** (Jan 1 - Mar 31). | Use one CTE to filter customers by registration date, and a second CTE to count the total orders for those specific customers. |
