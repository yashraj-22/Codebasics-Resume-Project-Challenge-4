SELECT 
    channel,
    ROUND(SUM(gross_price * sold_quantity)) AS gross_sales_mln,
    ROUND(100*ROUND(SUM(gross_price * sold_quantity))/sum(ROUND(SUM(gross_price * sold_quantity))) over(),2) as percentage
FROM
    gdb023.dim_customer c
        INNER JOIN
    gdb023.fact_sales_monthly s ON c.customer_code = s.customer_code
        INNER JOIN
    gdb023.fact_gross_price g ON s.product_code = g.product_code
GROUP BY channel