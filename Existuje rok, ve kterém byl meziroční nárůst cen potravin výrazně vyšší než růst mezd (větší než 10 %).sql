SELECT 
    p.payroll_year AS year,
    AVG(p.value) AS avg_wage,
    AVG(cp.value) AS avg_food_price
FROM 
    czechia_payroll p
JOIN 
    czechia_price cp ON p.payroll_year = YEAR(cp.date_from)
GROUP BY 
    p.payroll_year
ORDER BY 
    p.payroll_year;