WITH unique_products_count AS (
SELECT 
    COUNT(DISTINCT CASE
            WHEN fiscal_year = 2020 THEN product_code
            ELSE NULL
        END) AS unique_products_count_2020,
    COUNT(DISTINCT CASE
            WHEN fiscal_year = 2021 THEN product_code
            ELSE NULL
        END) AS unique_products_count_2021
FROM
    fact_sales_monthly)

SELECT 
    unique_products_count_2020,
    unique_products_count_2021,
    ROUND(100 * ((unique_products_count_2021 - unique_products_count_2020) / unique_products_count_2020),
            2) AS percentage_chg
FROM
    unique_products_count