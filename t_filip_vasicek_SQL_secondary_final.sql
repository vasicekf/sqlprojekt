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
WHERE 
    e.year BETWEEN 2015 AND 2017
    AND e.GDP IS NOT NULL 
    AND e.GINI IS NOT NULL 
    AND c.population IS NOT NULL
    AND c.country IN ('Slovakia', 'Poland', 'Germany', 'Austria', 'Hungary', 'Croatia', 'Serbia', 'Norway')
GROUP BY 
 c.country, e.year;