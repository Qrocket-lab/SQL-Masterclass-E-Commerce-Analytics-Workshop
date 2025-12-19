# 📝 SQL Roadmap Challenges (60 Tasks)

## Tier 1: Basics, DDL, & DML (20 Tasks)
[cite_start]*Mastering Keywords, Data Types, Operators, and Table Structures[cite: 4, 5, 6, 15].*

| # | Goal | Roadmap Focus |
| :--- | :--- | :--- |
| 1 | Select all columns from `Products`. | [cite_start]SELECT Statement [cite: 16] |
| 2 | Get `product_name` with ALIAS "Item". | [cite_start]Statements [cite: 20] |
| 3 | Filter products with `price > 500`. | [cite_start]WHERE Clause [cite: 29] |
| 4 | Sort customers by registration date (newest first). | [cite_start]ORDER BY [cite: 35] |
| 5 | List unique category IDs from Products. | [cite_start]SELECT DISTINCT [cite: 25] |
| 6 | Find products with 'Gaming' in their name. | [cite_start]LIKE Operator [cite: 6] |
| 7 | List orders with IDs 501, 502, or 503. | [cite_start]IN Operator [cite: 6] |
| 8 | Find products with stock between 10 and 100. | [cite_start]BETWEEN Operator [cite: 6] |
| 9 | Select orders NOT using a coupon. | [cite_start]Logical NOT [cite: 6] |
| 10 | Get the top 3 most expensive products. | [cite_start]LIMIT/TOP [cite: 25] |
| 11 | **DDL**: Create a temporary table `Temp_Inventory`. | [cite_start]CREATE TABLE [cite: 24] |
| 12 | **DDL**: Add a `phone_number` column to Customers. | [cite_start]ALTER TABLE [cite: 23] |
| 13 | **DDL**: Delete the `Temp_Inventory` table. | [cite_start]DROP TABLE [cite: 27] |
| 14 | **DDL**: Wipe all data from a test table. | [cite_start]TRUNCATE TABLE [cite: 21] |
| 15 | **Constraints**: Ensure email is never empty. | [cite_start]NOT NULL [cite: 46] |
| 16 | **Constraints**: Ensure category names are never duplicated. | [cite_start]UNIQUE [cite: 44] |
| 17 | **Constraints**: Ensure stock is never negative. | [cite_start]CHECK [cite: 53] |
| 18 | **DML**: Add a new category 'Furniture'. | [cite_start]INSERT [cite: 17] |
| 19 | **DML**: Increase all prices by 5%. | [cite_start]UPDATE [cite: 19] |
| 20 | **DML**: Remove reviews with a rating of 1. | [cite_start]DELETE [cite: 18] |

---

## Tier 2: Aggregations, JOINs, & Functions (20 Tasks)
[cite_start]*Intermediate analysis using summary queries and advanced built-in functions[cite: 38, 54, 61].*

| # | Goal | Roadmap Focus |
| :--- | :--- | :--- |
| 21 | Total number of orders placed. | [cite_start]COUNT [cite: 26] |
| 22 | Total revenue from all order items. | [cite_start]SUM [cite: 26] |
| 23 | Average rating for all products. | [cite_start]AVG [cite: 31] |
| 24 | Find the cheapest item in the store. | [cite_start]MIN [cite: 32] |
| 25 | Find the highest salary among employees. | [cite_start]MAX [cite: 37] |
| 26 | Count orders per customer. | [cite_start]GROUP BY [cite: 34] |
| 27 | List customers with more than 5 orders. | [cite_start]HAVING [cite: 36] |
| 28 | Show order IDs with customer emails. | [cite_start]INNER JOIN [cite: 55] |
| 29 | List all products and their reviews (even if 0). | [cite_start]LEFT JOIN [cite: 56] |
| 30 | Show all coupons and any orders using them. | [cite_start]RIGHT JOIN [cite: 57] |
| 31 | Combine all shipping logs and order records. | [cite_start]FULL OUTER JOIN [cite: 62] |
| 32 | Combine employee first and last names. | [cite_start]CONCAT [cite: 59] |
| 33 | Convert product names to uppercase. | [cite_start]UPPER [cite: 68] |
| 34 | Get the length of all customer emails. | [cite_start]LENGTH [cite: 60] |
| 35 | Round all prices to the nearest dollar. | [cite_start]ROUND [cite: 63] |
| 36 | Handle NULL coupons by showing 'No Code'. | [cite_start]COALESCE [cite: 75] |
| 37 | **CASE**: Label products as 'High' or 'Low' stock. | [cite_start]Conditional [cite: 70, 80] |
| 38 | Find the day of the week for all orders. | [cite_start]Date Functions [cite: 88] |
| 39 | Calculate expiry date + 30 days for coupons. | [cite_start]DATEADD [cite: 85] |
| 40 | Create a view `Sales_Summary`. | [cite_start]Views [cite: 74, 79] |

---

## Tier 3: Advanced SQL & Optimization (20 Tasks)
[cite_start]*Mastering complex logic, performance, and security[cite: 90, 113, 115, 121].*

| # | Goal | Roadmap Focus |
| :--- | :--- | :--- |
| 41 | Rank products by price in each category. | [cite_start]ROW_NUMBER [cite: 112] |
| 42 | Dense rank employees by salary. | [cite_start]DENSE_RANK [cite: 107] |
| 43 | Find the previous order date for each customer. | [cite_start]LAG [cite: 109] |
| 44 | Find the next order date for each customer. | [cite_start]LEAD [cite: 109] |
| 45 | Use a CTE to filter for 'active' customers. | [cite_start]CTEs [cite: 121] |
| 46 | Match employees to their manager names. | [cite_start]Self Join [cite: 67] |
| 47 | Generate every possible product/coupon combo. | [cite_start]Cross Join [cite: 71] |
| 48 | Use a Recursive CTE for employee hierarchy. | [cite_start]Recursive Queries [cite: 114] |
| 49 | **Transaction**: Execute a payment and stock update. | [cite_start]BEGIN/COMMIT [cite: 103, 106] |
| 50 | **Transaction**: Cancel a failed order update. | [cite_start]ROLLBACK [cite: 108] |
| 51 | **Transaction**: Use a savepoint during an update. | [cite_start]SAVEPOINT [cite: 111] |
| 52 | Index the `email` column for faster login. | [cite_start]Indexes [cite: 87, 92] |
| 53 | **Security**: Allow a 'Viewer' role to see products. | [cite_start]GRANT [cite: 101] |
| 54 | **Security**: Stop a user from deleting orders. | [cite_start]REVOKE [cite: 101] |
| 55 | Use `EXPLAIN` to analyze a slow join query. | [cite_start]Query Analysis [cite: 91, 93] |
| 56 | Remove unnecessary subqueries from a report. | [cite_start]Query Optimization [cite: 81, 94] |
| 57 | Create a Procedure to log new product stock. | [cite_start]Stored Procedures [cite: 89] |
| 58 | Create a Function to calculate tax (10%). | [cite_start]Functions [cite: 89] |
| 59 | **Pivot**: Total sales per month as columns. | [cite_start]Pivot Operations [cite: 116] |
| 60 | Execute a query stored in a variable. | [cite_start]Dynamic SQL [cite: 122] |
