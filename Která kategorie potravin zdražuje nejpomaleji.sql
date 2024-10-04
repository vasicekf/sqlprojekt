SELECT 
    YEAR(cp.date_from) AS year,
    pc.name AS food_category,
    AVG(cp.value) AS avg_food_price
FROM 
    czechia_price cp
JOIN 
    czechia_price_category pc ON cp.category_code = pc.code
WHERE 
    cp.value IS NOT NULL
GROUP BY 
    YEAR(cp.date_from), pc.name
ORDER BY 
    year, pc.name;