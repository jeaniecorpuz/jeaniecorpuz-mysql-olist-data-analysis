USE capstone_olist;

# Q7: How many customers are repeat vs. one-time buyers?

SELECT * FROM customers; #customer_id; customer_unique_id
SELECT * FROM order_payments; #order_id; payment_value
SELECT * FROM orders; #order_id; customer_id

WITH customer_orders AS
    (
SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS order_count
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
    )
SELECT
    CASE
        WHEN order_count = 1 THEN 'one-time customer'
        WHEN order_count > 1 THEN 'repeat customer'
    END AS customer_type,

    COUNT(*) AS num_customers
FROM customer_orders
GROUP BY
    CASE
        WHEN order_count = 1 THEN 'one-time customer'
        WHEN order_count > 1 THEN 'repeat customer'
    END;
