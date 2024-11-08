-- View for Region Economic Summary
CREATE VIEW Region_Economic_Summary AS
SELECT 
    c.region,
    AVG(e.gdp) AS avg_gdp,
    SUM(c.population) AS total_population,
    AVG(e.gdp_growth_rate) AS avg_gdp_growth_rate
FROM Economic_Indicators e
JOIN Country c ON e.country_id = c.country_id
GROUP BY c.region;

-- View for Country Trade Balance
CREATE VIEW Country_Trade_Balance AS
SELECT 
    c.name AS country_name,
    t.year,
    t.exports,
    t.imports,
    t.trade_balance
FROM Trade t
JOIN Country c ON t.country_id = c.country_id;
