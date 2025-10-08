CREATE TABLE products(
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(50),
product_code VARCHAR(8),
category VARCHAR(50),
unit_price DECIMAL(8,2),
stock_quantity INT
);

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50),
  gender CHAR(1),
  city VARCHAR(50),
  state VARCHAR(50),
  signup_date DATE
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  order_date DATE,
  customer_id INT REFERENCES customers(customer_id),
  product_id INT REFERENCES products(product_id),
  quantity INT,
  payment_method VARCHAR(20),
  order_status VARCHAR(20)
);

CREATE TABLE returns (
  return_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(order_id),
  return_date DATE,
  reason TEXT,
  refund_status VARCHAR(20)
);

INSERT INTO products (product_name, product_code, category, unit_price, stock_quantity) VALUES
('Bluetooth Speaker', 'SPK001', 'Electronics', 1499.00, 50),
('Cotton T-Shirt', 'TSH001', 'Apparel', 599.00, 120),
('LED Bulb Pack', 'BLB001', 'Home Utility', 199.00, 80),
('Yoga Mat', 'YGM001', 'Fitness', 899.00, 40),
('Stainless Bottle', 'BOT001', 'Kitchenware', 499.00, 60),
('Wireless Mouse', 'MOU001', 'Electronics', 899.00, 70),
('Running Shoes', 'SHO001', 'Apparel', 2999.00, 35),
('Pressure Cooker', 'COO001', 'Kitchenware', 1899.00, 25),
('Smartwatch', 'SWT001', 'Electronics', 3499.00, 30),
('Notebook Set', 'NTB001', 'Stationery', 149.00, 100);

INSERT INTO customers (customer_name, gender, city, state, signup_date) VALUES
('Aditi Sharma', 'F', 'Noida', 'UP', '2023-06-15'),
('Rohan Mehta', 'M', 'Mumbai', 'MH', '2022-11-20'),
('Neha Verma', 'F', 'Jaipur', 'RJ', '2023-01-05'),
('Arjun Singh', 'M', 'Delhi', 'DL', '2021-09-12'),
('Priya Nair', 'F', 'Kochi', 'KL', '2024-03-08'),
('Sahil Khan', 'M', 'Bhopal', 'MP', '2023-07-22'),
('Isha Patel', 'F', 'Ahmedabad', 'GJ', '2022-12-01'),
('Manish Rawat', 'M', 'Dehradun', 'UK', '2023-04-17'),
('Simran Kaur', 'F', 'Chandigarh', 'CH', '2023-08-10'),
('Ankit Joshi', 'M', 'Lucknow', 'UP', '2021-10-30');

INSERT INTO orders (order_date, customer_id, product_id, quantity, payment_method, order_status) VALUES
('2025-10-01', 1, 1, 2, 'UPI', 'Delivered'),
('2025-10-01', 2, 2, 1, 'Credit Card', 'Delivered'),
('2025-10-02', 3, 3, 3, 'Cash', 'Cancelled'),
('2025-10-02', 4, 4, 1, 'Debit Card', 'Delivered'),
('2025-10-03', 5, 5, 2, 'UPI', 'Returned'),
('2025-10-03', 6, 6, 1, 'Credit Card', 'Delivered'),
('2025-10-04', 7, 7, 1, 'UPI', 'Delivered'),
('2025-10-04', 8, 8, 1, 'Cash', 'Delivered'),
('2025-10-05', 9, 9, 1, 'Debit Card', 'Delivered'),
('2025-10-05', 10, 10, 5, 'UPI', 'Delivered');

INSERT INTO returns (order_id, return_date, reason, refund_status) VALUES
(5, '2025-10-06', 'Damaged item', 'Refunded'),
(3, '2025-10-03', 'Wrong product', 'Not Refunded'),
(7, '2025-10-07', 'Size issue', 'Refunded'),
(9, '2025-10-08', 'Late delivery', 'Refunded'),
(6, '2025-10-09', 'Changed mind', 'Not Refunded');

INSERT INTO orders (order_date, customer_id, product_id, quantity, payment_method, order_status) VALUES
('2025-10-06', 1, 6, 1, 'UPI', 'Delivered'),
('2025-10-06', 2, 7, 2, 'Credit Card', 'Delivered'),
('2025-10-07', 3, 8, 1, 'Cash', 'Delivered'),
('2025-10-07', 4, 9, 1, 'Debit Card', 'Returned'),
('2025-10-08', 5, 10, 3, 'UPI', 'Delivered'),
('2025-10-08', 6, 1, 1, 'Credit Card', 'Delivered'),
('2025-10-09', 7, 2, 2, 'UPI', 'Cancelled'),
('2025-10-09', 8, 3, 1, 'Cash', 'Delivered'),
('2025-10-10', 9, 4, 1, 'Debit Card', 'Delivered'),
('2025-10-10', 10, 5, 2, 'UPI', 'Delivered');

--Total Sales By Category...
SELECT category ,SUM(o.quantity * p.unit_price) AS total_sales
FROM orders o
JOIN products p ON p.product_id = o.product_id
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY category;

--Top 5 Customers...
SELECT customer_name ,SUM(o.quantity * p.unit_price) AS total_sales
FROM orders o
JOIN products p ON p.product_id = o.product_id
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;

SELECT * FROM orders;

--Monthly Order Volume...
SELECT 
  DATE_TRUNC('month', order_date) AS month,
  COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;

--Return Rate By Product...
SELECT 
  p.product_name,
  COUNT(r.return_id) AS total_returns,
  COUNT(o.order_id) AS total_orders,
  ROUND(COUNT(r.return_id)::decimal / COUNT(o.order_id) * 100, 2) AS return_rate_percent
FROM products p
JOIN orders o ON o.product_id = p.product_id
LEFT JOIN returns r ON r.order_id = o.order_id
GROUP BY p.product_name
ORDER BY return_rate_percent DESC;

--Payment Method Breakdown...
SELECT
	payment_method,
	count(*) AS total_orders,
	sum(o.quantity * p.unit_price) AS total_sales
FROM orders o
JOIN products p ON p.product_id = o.product_id
WHERE o.order_status = 'Delivered'
GROUP BY payment_method
ORDER BY total_sales DESC;