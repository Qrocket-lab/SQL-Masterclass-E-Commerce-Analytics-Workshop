-- SQL Masterclass: E-Commerce Analytics Workshop - Database Setup

-- This file contains the complete SQL code to create the necessary tables
-- and populate them with mock data for the challenges.
-- 1. DDL: SCHEMA CREATION [cite: 15]
-----------------------------------------------------

-- Employees for Self-Joins and Security [cite: 67, 98]
CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    manager_id INTEGER REFERENCES Employees(employee_id), -- For Self-Joins
    salary DECIMAL(10,2) CHECK (salary > 0), -- Data Constraints [cite: 47, 53]
    hire_date DATE
);

-- Categories with Unique Constraints [cite: 44]
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL
);

-- Products [cite: 24, 33, 39]
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INTEGER REFERENCES Categories(category_id),
    price DECIMAL(10, 2),
    stock_quantity INTEGER DEFAULT 0
);

-- Customers and Security Tracking [cite: 101, 105]
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP [cite: 82]
);

-- Coupons for Conditional Logic [cite: 70, 80]
CREATE TABLE Coupons (
    coupon_id VARCHAR(10) PRIMARY KEY,
    discount_pct INTEGER,
    expiry_date DATE
);

-- Orders & Items [cite: 54]
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES Customers(customer_id),
    order_date DATE,
    coupon_id VARCHAR(10) REFERENCES Coupons(coupon_id)
);

CREATE TABLE Order_Items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER REFERENCES Orders(order_id),
    product_id INTEGER REFERENCES Products(product_id),
    quantity INTEGER,
    unit_price DECIMAL(10,2)
);

-- Product Reviews for String/Advanced Analysis [cite: 61, 73]
CREATE TABLE Reviews (
    review_id INTEGER PRIMARY KEY,
    product_id INTEGER REFERENCES Products(product_id),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT
);

-- 2. DML: MOCK DATA INSERTION [cite: 22]
-----------------------------------------------------
INSERT INTO Categories VALUES (1, 'Electronics'), (2, 'Accessories'), (3, 'Home');
INSERT INTO Employees VALUES (1, 'Lead', 'Manager', NULL, 95000, '2020-01-01'), (2, 'Staff', 'One', 1, 60000, '2021-05-10');
INSERT INTO Products VALUES (101, 'Laptop X', 1, 1200, 50), (102, 'Gaming Mouse', 2, 80, 200), (103, 'Old Keyboard', 2, 45, 10);
INSERT INTO Customers VALUES (1, 'alice@test.com', '2023-01-15 10:00:00'), (2, 'bob@demo.com', '2023-03-20 14:30:00');
INSERT INTO Coupons VALUES ('WINTER20', 20, '2025-12-31');
INSERT INTO Orders VALUES (501, 1, '2023-05-01', 'WINTER20'), (502, 2, '2023-06-15', NULL);
INSERT INTO Order_Items VALUES (1, 501, 101, 1, 1200), (2, 502, 102, 2, 80);
INSERT INTO Reviews VALUES (1, 101, 5, 'Best purchase ever!'), (2, 102, 3, 'Average quality.');
