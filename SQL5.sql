USE capstone_olist;

# Q5: Rank top 3 products within each category by revenue

SELECT * FROM order_items; #order_id #product_id
SELECT * FROM products; #product_id
SELECT * FROM product_category; #product_id
SELECT * FROM order_payments; #order_id

WITH product_revenue AS
    (
SELECT
    pc.product_category_name_english,
    p.product_id,
    ROUND(SUM(o.price), 2) AS total_revenue
FROM order_items AS o
JOIN products AS p ON p.product_id = o.product_id
JOIN product_category AS pc ON pc.product_category_name = p.product_category_name
GROUP BY
    pc.product_category_name_english,
    p.product_id
    ),
    product_ranked AS (
    SELECT
        product_category_name_english,
        product_id,
        total_revenue,
    ROW_NUMBER() OVER (
        PARTITION BY product_category_name_english
        ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM product_revenue
    )
SELECT
    product_category_name_english,
    product_id,
    total_revenue,
    revenue_rank
FROM product_ranked
WHERE revenue_rank <= 3
ORDER BY
    product_category_name_english,
    revenue_rank;
