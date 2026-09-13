USE capstone_olist;

SELECT * FROM order_items; #order_id #product_id
SELECT * FROM products; #product_id
SELECT * FROM product_category; #product_id
SELECT * FROM order_payments; #order_id

# Q4: Which product categories generate the most revenue?

#order_items -> order_payments, use order_id
#order_items -> products, use product_id

SELECT
    pc.product_category_name_english,
    ROUND(SUM(o.price), 2) AS total_revenue
FROM order_items AS o
JOIN products AS p ON p.product_id = o.product_id
JOIN product_category AS pc ON pc.product_category_name = p.product_category_name
GROUP BY pc.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;
