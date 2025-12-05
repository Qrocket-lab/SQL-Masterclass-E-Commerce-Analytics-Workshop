-- SQL Masterclass: E-Commerce Analytics Workshop - Database Setup

-- This file contains the complete SQL code to create the necessary tables
-- and populate them with mock data for the challenges.

-----------------------------------------------------
-- 1. SCHEMA CREATION
-----------------------------------------------------

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

-----------------------------------------------------
-- 2. MOCK DATA INSERTION
-----------------------------------------------------

-- Mock Data for Customers
INSERT INTO Customers (customer_id, first_name, last_name, email, registration_date) VALUES
(101, 'Alice', 'Smith', 'alice@example.com', '2023-01-15'),
(102, 'Bob', 'Johnson', 'bob@example.com', '2023-02-20'),
(103, 'Charlie', 'Brown', 'charlie@example.com', '2023-03-01'),
(104, 'Diana', 'Prince', 'diana@example.com', '2023-04-10'),
(105, 'Evan', 'Wright', 'evan@example.com', '2023-05-25');

-- Mock Data for Products
INSERT INTO Products (product_id, product_name, category, price) VALUES
(1, 'Laptop Pro X', 'Electronics', 1200.00),
(2, 'Mechanical Keyboard', 'Accessories', 150.00),
(3, 'Wireless Mouse', 'Accessories', 50.00),
(4, 'Gaming Chair Z', 'Furniture', 350.00),
(5, '4K Monitor', 'Electronics', 450.00);

-- Mock Data for Orders (10 total orders)
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity, order_total) VALUES
(1001, 101, 1, '2023-01-20', 1, 1200.00), -- Alice: Laptop (1st order)
(1002, 102, 2, '2023-02-25', 2, 300.00),  -- Bob: Keyboard (1st order)
(1003, 101, 3, '2023-03-05', 1, 50.00),   -- Alice: Mouse (2nd order)
(1004, 103, 4, '2023-03-10', 1, 350.00),  -- Charlie: Chair (1st order)
(1005, 104, 5, '2023-04-15', 1, 450.00),  -- Diana: Monitor (1st order)
(1006, 102, 3, '2023-04-20', 3, 150.00),  -- Bob: Mouse (2nd order)
(1007, 105, 1, '2023-06-01', 1, 1200.00), -- Evan: Laptop (1st order)
(1008, 101, 5, '2023-06-10', 2, 900.00),  -- Alice: Monitor (3rd order)
(1009, 103, 2, '2023-07-01', 1, 150.00),  -- Charlie: Keyboard (2nd order)
(1010, 102, 4, '2023-07-15', 1, 350.00);  -- Bob: Chair (3rd order)
