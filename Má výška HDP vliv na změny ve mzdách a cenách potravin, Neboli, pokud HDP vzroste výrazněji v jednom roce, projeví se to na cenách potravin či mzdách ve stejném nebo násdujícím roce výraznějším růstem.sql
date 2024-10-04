SELECT 
    p.payroll_year AS year,
    AVG(p.value) AS avg_wage,
    AVG(cp.value) AS avg_food_price,
    e.gdp AS gdp
FROM 
    czechia_payroll p
JOIN 
    czechia_price cp ON p.payroll_year = YEAR(cp.date_from)
JOIN 
    economies e ON p.payroll_year = e.year AND e.country = 'Czech Republic'
GROUP BY 
    p.payroll_year, e.gdp
ORDER BY 
    p.payroll_year;