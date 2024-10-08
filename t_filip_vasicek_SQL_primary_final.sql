CREATE TABLE t_filip_vasicek_SQL_primary_final AS
SELECT 
    p.payroll_year AS year,
    p.payroll_quarter AS quarter,
    pib.name AS industry_branch,
    p.value AS wage,
    pc.name AS food_category,
    cp.value AS food_price,
    pc.price_value AS food_price_per_unit,
    pc.price_unit AS unit,
    r.name AS region_name,
    d.name AS district_name
FROM 
    czechia_payroll p
JOIN 
    czechia_payroll_industry_branch pib ON p.industry_branch_code = pib.code
JOIN 
    czechia_price cp ON p.payroll_year = YEAR(cp.date_from)
JOIN 
    czechia_price_category pc ON cp.category_code = pc.code
JOIN 
    czechia_payroll_value_type pvt ON p.value_type_code = 5958
JOIN 
    czechia_payroll_calculation calc ON p.calculation_code = 100
JOIN 
    czechia_region r ON cp.region_code = r.code
JOIN 
    czechia_district d ON r.code = LEFT(d.code, 5)
WHERE 
    p.payroll_year IN (
        SELECT DISTINCT YEAR(cp.date_from)
        FROM czechia_price cp
        WHERE YEAR(cp.date_from) IN (SELECT DISTINCT payroll_year FROM czechia_payroll)
    )
    AND p.payroll_year IS NOT NULL 
    AND cp.date_from IS NOT NULL 
    AND p.value IS NOT NULL;