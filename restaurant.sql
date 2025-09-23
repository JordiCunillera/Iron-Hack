USE restaurante;

-- 1. ¿Cuál es la cantidad total que gastó cada cliente en el restaurante?
SELECT customer_id, SUM(price) FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;

-- 2. ¿Cuántos días ha visitado cada cliente el restaurante?
SELECT customer_id, COUNT(DISTINCT(order_date)) FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;

-- 3. ¿Cuál fue el primer artículo del menú comprado por cada cliente?
SELECT customer_id, MIN(order_date) FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;

-- 4. ¿Cuál es el artículo más comprado en el menú y cuántas veces lo compraron todos los clientes?
SELECT product_id, COUNT(product_id) AS count_sales FROM sales
GROUP BY product_id
ORDER BY count_sales DESC
LIMIT 1;

-- 5. ¿Qué artículo fue el más popular para cada cliente?
CREATE TEMPORARY TABLE temp_5 AS
SELECT customer_id, product_id, COUNT(product_id) AS count_sales FROM sales
GROUP BY customer_id, product_id;

SELECT * FROM temp_5;

SELECT customer_id, count_sales FROM temp_5
GROUP BY customer_id
ORDER BY count_sales;

-- 6.  



SELECT customer_id, MIN(order_date) FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;
