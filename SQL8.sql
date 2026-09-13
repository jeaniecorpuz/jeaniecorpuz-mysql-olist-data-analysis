USE capstone_olist;

SELECT * FROM order_items; #order_id #product_id
SELECT * FROM products; #product_id
SELECT * FROM product_category; #product_id
SELECT * FROM order_payments; #order_id

#order_items -> order_payments, use order_id
#order_items -> products, use product_id

# Q8: What percentage (%) of total revenue comes from the top category?

WITH category_revenue AS
         (
SELECT
    pc.product_category_name AS category,
    pc.product_category_name_english AS english_category,
    SUM(oi.price) AS category_revenue
FROM order_items AS oi
JOIN products AS p ON p.product_id = oi.product_id
JOIN product_category AS pc ON pc.product_category_name = p.product_category_name
GROUP BY
    pc.product_category_name,
    pc.product_category_name_english
          )
SELECT
    category,
    english_category,
    ROUND(category_revenue, 2) AS category_revenue,
    ROUND(
        category_revenue
            /
        SUM(category_revenue)
        OVER () * 100,
        2) AS revenue_percentage
FROM category_revenue
ORDER BY category_revenue DESC
LIMIT 1;
