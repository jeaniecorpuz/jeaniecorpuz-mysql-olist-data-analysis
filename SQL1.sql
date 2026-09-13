CREATE database capstone_olist;
USE capstone_olist;

SHOW TABLES;

# Q1 Who are the top 10 customers by total amount spent?
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_payments;

SELECT
    c.customer_unique_id,
    SUM(op.payment_value) AS total_spent
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_payments AS op ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;
