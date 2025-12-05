# 🚀 SQL Masterclass: E-Commerce Analytics Workshop

This repository hosts a hands-on workshop designed to elevate your SQL skills from foundational commands to advanced analytical techniques. We use a consistent, realistic **e-commerce dataset** across all challenges, providing practical context for your queries.

## 🎯 Learning Objectives

* **Foundational Skills (Tier 1):** Master `SELECT`, `WHERE`, `ORDER BY`, and basic filtering.
* **Intermediate Skills (Tier 2):** Implement powerful aggregations using `GROUP BY` and `HAVING`, and combine data with various `JOIN` types.
* **Advanced Analytics (Tier 3):** Utilize cutting-edge SQL features like **Window Functions** (`ROW_NUMBER()`, `NTILE()`, `MIN() OVER (...)`) and **Common Table Expressions (CTEs)** for complex, multi-stage analysis.

## 🛠️ Getting Started

To follow along with the challenges, you must first set up the database schema and populate it with mock data. All necessary SQL code is provided in the **`database_setup.sql`** file.

### E-Commerce Schema Overview

The dataset consists of three core tables:

| Table Name | Description | Key Fields |
| :--- | :--- | :--- |
| **`Customers`** | User registration details. | `customer_id`, `registration_date` |
| **`Products`** | Inventory and pricing information. | `product_id`, `category`, `price` |
| **`Orders`** | Transactional data. | `order_id`, `customer_id` (FK), `product_id` (FK), `order_total` |

## 📝 Challenge Walkthrough

Navigate to the **`challenges.md`** file to start the workshop. Once you've attempted the problems, you can find the verified SQL solutions in the **`solutions.sql`** file.

Good luck! 🚀
