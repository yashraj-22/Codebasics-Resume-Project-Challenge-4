WITH products_sold AS (
SELECT 
    p.division,
    p.product_code,
    p.product,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    fact_sales_monthly s
        JOIN
    dim_product p ON s.product_code = p.product_code
WHERE
    s.fiscal_year = 2021
GROUP BY p.product_code),
products_sold_ranking AS (
SELECT *,
	DENSE_RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) AS rnk
FROM 
	products_sold)
    
SELECT 
    division,
    product_code,
    product,
    total_sold_quantity,
    rnk AS rank_order
FROM
    products_sold_ranking
WHERE
    rnk <= 3