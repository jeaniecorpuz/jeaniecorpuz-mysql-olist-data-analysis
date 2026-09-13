USE capstone_olist;
SHOW TABLES;

# Q2 What is the monthly revenue trend across the dataset?

SELECT * FROM orders;
SELECT * FROM order_payments;

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS num_orders,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
FROM orders AS o
JOIN order_payments AS op ON o.order_id = op.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY month;
