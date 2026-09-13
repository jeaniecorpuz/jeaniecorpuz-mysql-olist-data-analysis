USE capstone_olist;

# Q3: What is the month-over-month change in revenue?

SELECT * FROM orders;

WITH monthly_revenue_trend AS
    (
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(*) AS num_payments,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
FROM orders AS o
JOIN order_payments AS op ON o.order_id = op.order_id
GROUP BY DATE_FORMAT(order_purchase_timestamp, '%Y-%m')
    )
SELECT
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month) AS prev_month,
    total_revenue - LAG(total_revenue) OVER (ORDER BY month) AS revenue_change
FROM monthly_revenue_trend
ORDER BY month;
