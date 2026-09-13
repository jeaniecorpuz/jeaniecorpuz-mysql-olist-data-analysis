USE capstone_olist;

# Q6: Segment customers into spend tiers (Low / Medium / High)

SELECT * FROM customers; #customer_id; customer_unique_id
SELECT * FROM order_payments; #order_id; payment_value
SELECT * FROM orders; #order_id; customer_id

WITH customer_spending AS
    (
SELECT
    o.customer_id,
    ROUND(SUM(payment_value), 2) AS total_spent
FROM orders AS o
JOIN order_payments AS op ON o.order_id = op.order_id
JOIN customers AS c ON o.customer_id = c.customer_id
GROUP BY customer_id
     )
SELECT customer_id,
       total_spent,
        CASE
            WHEN total_spent < 5000 THEN 'Low'
            WHEN total_spent <= 8000 THEN 'Medium'
            ELSE 'High'
        END AS spend_tier
FROM customer_spending
ORDER BY total_spent DESC;
