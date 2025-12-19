# 📝 SQL Roadmap Mastery: 60 Challenges

[cite_start]This workshop follows the official SQL Roadmap [cite: 7, 9][cite_start], covering everything from Basic Syntax [cite: 14] [cite_start]to Advanced SQL[cite: 115]. Use the tables in `database_setup.sql` to solve these.

---

## Tier 1: Basics, DDL, & DML (Tasks 1-20)
[cite_start]*Focus: Data Definition Language (DDL) [cite: 15][cite_start], Data Manipulation Language (DML) [cite: 22][cite_start], and Data Constraints[cite: 47].*

| # | Goal | [cite_start]Roadmap Hint [cite: 1, 8] |
| :--- | :--- | :--- |
| **1** | Retrieve all product details. | [cite_start]Use `SELECT *`[cite: 16]. |
| **2** | Show names as "Item Name". | [cite_start]Use `AS` for Aliasing[cite: 20]. |
| **3** | Products over $500. | [cite_start]Use `WHERE` clause[cite: 29]. |
| **4** | Sort users by newest registration. | [cite_start]Use `ORDER BY ... DESC`[cite: 35]. |
| **5** | List unique category IDs. | [cite_start]Use `SELECT DISTINCT`[cite: 11]. |
| **6** | Find "Gaming" products. | [cite_start]Use `LIKE '%Gaming%'`[cite: 4]. |
| **7** | Filter specific order IDs. | [cite_start]Use `IN (501, 502)`[cite: 6]. |
| **8** | Stock between 10 and 100. | [cite_start]Use `BETWEEN` operator[cite: 6]. |
| **9** | Orders with NO coupon. | [cite_start]Use `IS NULL`[cite: 72]. |
| **10** | Top 3 expensive items. | [cite_start]Use `LIMIT 3`[cite: 4]. |
| **11** | Create table `Test_Logs`. | Use `CREATE TABLE`[cite: 24]. |
| **12** | Add `phone` to Customers. | [cite_start]Use `ALTER TABLE ... ADD`[cite: 23]. |
| **13** | Remove `Test_Logs`. | Use `DROP TABLE`[cite: 27]. |
| **14** | Clear table without deleting it. | [cite_start]Use `TRUNCATE TABLE`[cite: 21]. |
| **15** | Email cannot be empty. | [cite_start]Use `NOT NULL` constraint[cite: 46]. |
| **16** | Category names must be unique. | [cite_start]Use `UNIQUE` constraint[cite: 44]. |
| **17** | Rating must be 1 to 5. | [cite_start]Use `CHECK` constraint[cite: 53]. |
| **18** | Add a new employee record. | [cite_start]Use `INSERT INTO`[cite: 17, 40]. |
| **19** | Increase all prices by 10%. | [cite_start]Use `UPDATE ... SET`[cite: 19, 41]. |
| **20** | Delete 1-star reviews. | [cite_start]Use `DELETE FROM`[cite: 18, 42]. |

---

## Tier 2: Aggregations, JOINs, & Functions (Tasks 21-40)
[cite_start]*Focus: Aggregate Queries [cite: 38][cite_start], JOIN Queries [cite: 54][cite_start], and Advanced Functions[cite: 61].*

| # | Goal | [cite_start]Roadmap Hint [cite: 1, 8] |
| :--- | :--- | :--- |
| **21** | Count total orders. | [cite_start]Use `COUNT(*)`[cite: 26]. |
| **22** | Total store revenue. | [cite_start]Use `SUM(unit_price * quantity)`[cite: 26]. |
| **23** | Average employee salary. | [cite_start]Use `AVG()`[cite: 31]. |
| **24** | Minimum product price. | [cite_start]Use `MIN()`[cite: 32]. |
| **25** | Highest product price. | [cite_start]Use `MAX()`[cite: 37]. |
| **26** | Items per category. | [cite_start]Use `GROUP BY`[cite: 34, 43]. |
| **27** | Categories with > 5 items. | [cite_start]Use `HAVING` clause[cite: 36, 45]. |
| **28** | Match Orders to Emails. | [cite_start]Use `INNER JOIN`[cite: 30, 55]. |
| **29** | Products and their Reviews. | [cite_start]Use `LEFT JOIN`[cite: 56]. |
| **30** | Coupons and used Orders. | [cite_start]Use `RIGHT JOIN`[cite: 57]. |
| **31** | Total user/order map. | [cite_start]Use `FULL OUTER JOIN`[cite: 62]. |
| **32** | Combine "First Last" name. | [cite_start]Use `CONCAT()`[cite: 59]. |
| **33** | First 5 letters of product. | [cite_start]Use `SUBSTRING()`[cite: 65]. |
| **34** | Round tax to 2 decimals. | [cite_start]Use `ROUND()`[cite: 63]. |
| **35** | Swap "X" for "Pro" in names. | [cite_start]Use `REPLACE()`[cite: 65]. |
| **36** | Replace NULLs with 'Default'. | [cite_start]Use `COALESCE()`[cite: 75]. |
| **37** | If/Then logic for stock level. | [cite_start]Use `CASE` statement[cite: 70, 80]. |
| **38** | Get today's date. | [cite_start]Use `CURRENT_DATE` or `DATE`[cite: 77]. |
| **39** | Add 30 days to order date. | [cite_start]Use `DATEADD` or `+ INTERVAL`[cite: 85]. |
| **40** | Save a query as a View. | [cite_start]Use `CREATE VIEW`[cite: 74, 79]. |

---

## Tier 3: Advanced SQL & Optimization (Tasks 41-60)
[cite_start]*Focus: Window Functions [cite: 113][cite_start], CTEs [cite: 121][cite_start], Transactions [cite: 100][cite_start], and Performance[cite: 90].*

| # | Goal | [cite_start]Roadmap Hint [cite: 1, 8] |
| :--- | :--- | :--- |
| **41** | Rank products by price. | [cite_start]Use `ROW_NUMBER()`[cite: 112]. |
| **42** | Rank employees (handle ties). | [cite_start]Use `DENSE_RANK()`[cite: 107]. |
| **43** | User's last order date. | [cite_start]Use `LAG()`[cite: 110]. |
| **44** | User's next order date. | [cite_start]Use `LEAD()`[cite: 109]. |
| **45** | Simplify complex joins. | [cite_start]Use `WITH (CTE)`[cite: 121]. |
| **46** | Employee to Manager map. | [cite_start]Use `Self Join`[cite: 67]. |
| **47** | Every Product x Every Coupon. | [cite_start]Use `Cross Join`[cite: 71]. |
| **48** | Org Chart (Levels). | [cite_start]Use `WITH RECURSIVE`[cite: 114]. |
| **49** | Start a multi-step update. | [cite_start]Use `BEGIN` / `COMMIT`[cite: 103, 106]. |
| **50** | Undo a bad transaction. | [cite_start]Use `ROLLBACK`[cite: 108]. |
| **51** | Partial undo point. | [cite_start]Use `SAVEPOINT`[cite: 111]. |
| **52** | Speed up Email searches. | [cite_start]Use `CREATE INDEX`[cite: 87, 92]. |
| **53** | Give User "A" read access. | [cite_start]Use `GRANT SELECT`[cite: 101]. |
| **54** | Remove User "B" delete access. | [cite_start]Use `REVOKE DELETE`[cite: 101]. |
| **55** | Read Query Plan. | [cite_start]Use `EXPLAIN`[cite: 91, 96]. |
| **56** | Optimize Join Performance. | [cite_start]Avoid `SELECT *`, use Selective Projection[cite: 93, 95]. |
| **57** | Automate Order logic. | [cite_start]Use `CREATE PROCEDURE`[cite: 89]. |
| **58** | Custom Tax calculator. | [cite_start]Use `CREATE FUNCTION`[cite: 89]. |
| **59** | Rows to Columns (Sales/Mo). | [cite_start]Use `PIVOT` or `FILTER`[cite: 116]. |
| **60** | Build query from string. | [cite_start]Use `EXECUTE` (Dynamic SQL)[cite: 122]. |
