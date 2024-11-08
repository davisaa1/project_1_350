-- Create a materialized view for average economic indicators by region
CREATE MATERIALIZED VIEW Avg_Economic_Indicators_By_Region AS
SELECT 
    c.region,
    AVG(e.gdp) AS avg_gdp,
    AVG(e.inflation_rate) AS avg_inflation,
    AVG(e.unemployment_rate) AS avg_unemployment,
    AVG(e.gdp_growth_rate) AS avg_gdp_growth
FROM Economic_Indicators e
JOIN Country c ON e.country_id = c.country_id
GROUP BY c.region;

-- Refreshing the view periodically to update data
-- You can schedule a cron job or refresh manually as needed
-- REFRESH MATERIALIZED VIEW Avg_Economic_Indicators_By_Region;