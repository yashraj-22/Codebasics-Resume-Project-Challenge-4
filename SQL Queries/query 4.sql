WITH unique_products AS (
SELECT 
    p.segment,
    COUNT(DISTINCT CASE
            WHEN s.fiscal_year = 2020 THEN s.product_code
            ELSE NULL
        END) AS unique_product_2020,
    COUNT(DISTINCT CASE
            WHEN s.fiscal_year = 2021 THEN s.product_code
            ELSE NULL
        END) AS unique_product_2021
FROM
    dim_product p
        INNER JOIN
    fact_sales_monthly s ON p.product_code = s.product_code
GROUP BY p.segment)

SELECT 
    segment,
    unique_product_2020,
    unique_product_2021,
    (unique_product_2021 - unique_product_2020) AS difference
FROM
    unique_products
ORDER BY difference DESC;