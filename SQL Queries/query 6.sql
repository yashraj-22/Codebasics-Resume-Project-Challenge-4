SELECT 
    f.customer_code,
    customer,
    pre_invoice_discount_pct AS average_discount_percentage
FROM
    gdb023.fact_pre_invoice_deductions f
        INNER JOIN
    gdb023.dim_customer d ON f.customer_code = d.customer_code
WHERE
    fiscal_year = 2021 AND market = 'India'
ORDER BY average_discount_percentage DESC
LIMIT 0 , 5