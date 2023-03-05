SELECT 
    d.product_code, product, manufacturing_cost
FROM
    gdb023.dim_product d
        INNER JOIN
    gdb023.fact_manufacturing_cost f ON d.product_code = f.product_code
WHERE
    manufacturing_cost = (SELECT 
            MAX(manufacturing_cost)
        FROM
            gdb023.fact_manufacturing_cost)