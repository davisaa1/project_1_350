-- View for GDP growth trend over years for each country
CREATE VIEW GDP_Growth_Trend AS
SELECT 
    c.name AS country_name,
    e.year,
    e.gdp,
    e.gdp_growth_rate
FROM Economic_Indicators e
JOIN Country c ON e.country_id = c.country_id
ORDER BY c.name, e.year;

-- View for average inflation rate by region
CREATE VIEW Avg_Inflation_By_Region AS
SELECT 
    c.region,
    AVG(e.inflation_rate) AS avg_inflation_rate
FROM Economic_Indicators e
JOIN Country c ON e.country_id = c.country_id
GROUP BY c.region;

-- Procedure to retrieve yearly GDP summary for a region
CREATE OR REPLACE FUNCTION yearly_gdp_summary_by_region(region_name VARCHAR, start_year INT, end_year INT)
RETURNS TABLE(year INT, avg_gdp FLOAT, total_gdp FLOAT) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        e.year,
        AVG(e.gdp) AS avg_gdp,
        SUM(e.gdp) AS total_gdp
    FROM Economic_Indicators e
    JOIN Country c ON e.country_id = c.country_id
    WHERE c.region = region_name AND e.year BETWEEN start_year AND end_year
    GROUP BY e.year
    ORDER BY e.year;
END;
$$ LANGUAGE plpgsql;

