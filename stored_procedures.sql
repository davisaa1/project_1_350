-- Function to Log Function Calls
CREATE OR REPLACE FUNCTION log_function_call(func_name VARCHAR, params JSONB)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Function_Log (function_name, parameters) VALUES (func_name, params);
END;
$$ LANGUAGE plpgsql;

-- Procedure to Add or Update Economic Indicators
CREATE OR REPLACE PROCEDURE add_or_update_economic_indicator(
    _country_name VARCHAR,
    _year INT,
    _gdp FLOAT,
    _inflation_rate FLOAT,
    _unemployment_rate FLOAT,
    _gdp_growth_rate FLOAT
) LANGUAGE plpgsql AS $$ DECLARE
    country_id INT;
BEGIN
    SELECT country_id INTO country_id FROM Country WHERE name = _country_name;

    IF country_id IS NULL THEN
        RAISE EXCEPTION 'Country % not found in Country table', _country_name;
    END IF;

    INSERT INTO Economic_Indicators (country_id, year, gdp, inflation_rate, unemployment_rate, gdp_growth_rate)
    VALUES (country_id, _year, _gdp, _inflation_rate, _unemployment_rate, _gdp_growth_rate)
    ON CONFLICT (country_id, year) 
    DO UPDATE SET gdp = EXCLUDED.gdp,
                  inflation_rate = EXCLUDED.inflation_rate,
                  unemployment_rate = EXCLUDED.unemployment_rate,
                  gdp_growth_rate = EXCLUDED.gdp_growth_rate;
END; $$;

-- Example function for calculating average GDP
CREATE OR REPLACE FUNCTION avg_gdp_by_region(region_name VARCHAR, target_year INT)
RETURNS FLOAT AS $$
DECLARE avg_gdp FLOAT;
BEGIN
    SELECT AVG(e.gdp) INTO avg_gdp
    FROM Economic_Indicators e
    JOIN Country c ON e.country_id = c.country_id
    WHERE c.region = region_name AND e.year = target_year;
    RETURN avg_gdp;
END;
$$ LANGUAGE plpgsql;
