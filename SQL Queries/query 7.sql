SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT 
    MONTH(s.date) AS month,
    YEAR(s.date) AS year,
    ROUND(SUM(gross_price * sold_quantity)) AS Gross_sales_Amount
FROM
    gdb023.fact_sales_monthly s
        INNER JOIN
    gdb023.dim_customer c ON s.customer_code = c.customer_code
        INNER JOIN
    gdb023.fact_gross_price g ON s.product_code = g.product_code
WHERE
    customer = 'Atliq Exclusive'
GROUP BY month