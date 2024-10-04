SELECT 
    p.payroll_year AS year,
    pib.name AS industry_branch,
    AVG(p.value) AS average_wage
FROM 
    czechia_payroll p
JOIN 
    czechia_payroll_industry_branch pib ON p.industry_branch_code = pib.code
WHERE 
    p.payroll_year IS NOT NULL
GROUP BY 
    p.payroll_year, pib.name
ORDER BY 
    p.payroll_year, pib.name;
