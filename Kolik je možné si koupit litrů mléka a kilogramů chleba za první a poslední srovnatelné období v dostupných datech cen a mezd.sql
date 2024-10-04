SELECT 
    p.payroll_year AS year,
    pc.name AS food_category,
    AVG(cp.value) AS avg_food_price,
    AVG(p.value) AS avg_wage
FROM 
    czechia_payroll p
JOIN 
    czechia_price cp ON p.payroll_year = YEAR(cp.date_from)
JOIN 
    czechia_price_category pc ON cp.category_code = pc.code
WHERE 
    pc.name IN ('Chléb konzumní kmínový', 'Mléko polotučné pasterované')
GROUP BY 
    p.payroll_year, pc.name
ORDER BY 
    p.payroll_year;



