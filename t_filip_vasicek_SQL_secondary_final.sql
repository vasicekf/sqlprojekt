CREATE TABLE t_filip_vasicek_SQL_secondary_final AS
SELECT 
    c.country AS country,
    e.year,
    e.GDP,
    e.gini,
    c.population
FROM 
    economies e
JOIN 
    countries c ON e.country = c.country
JOIN 
    (SELECT DISTINCT p.payroll_year AS year
     FROM czechia_payroll p
     JOIN czechia_price cp ON p.payroll_year = YEAR(cp.date_from)
     WHERE p.payroll_year IS NOT NULL 
     AND cp.date_from IS NOT NULL 
     AND p.value IS NOT NULL
    ) AS cy ON e.year = cy.year
WHERE 
    e.GDP IS NOT NULL 
    AND e.gini IS NOT NULL 
    AND c.population IS NOT NULL
    AND c.country IN ('Czech Republic', 'Slovakia', 'Poland', 'Germany', 'Austria', 'Hungary', 'Croatia', 'Serbia', 'Norway')
GROUP BY 
    c.country, e.year;