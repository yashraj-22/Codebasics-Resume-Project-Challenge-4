SELECT 
    CASE
        WHEN MONTH(date) BETWEEN 9 AND 11 THEN 'Q1'
        WHEN MONTH(date) IN (12 , 1, 2) THEN 'Q2'
        WHEN MONTH(date) BETWEEN 3 AND 5 THEN 'Q3'
        WHEN MONTH(date) BETWEEN 6 AND 8 THEN 'Q4'
    END AS quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    gdb023.fact_sales_monthly
WHERE
    YEAR(date) = '2020'
GROUP BY quarter
ORDER BY total_sold_quantity DESC