-- Insert data into Country Table
INSERT INTO Country (name, region, sub_region, population, area_km2, currency, capital)
VALUES 
('Country A', 'Region 1', 'Sub-region 1', 1000000, 50000.0, 'Currency A', 'Capital A'),
('Country B', 'Region 2', 'Sub-region 2', 2000000, 75000.0, 'Currency B', 'Capital B');

-- Insert data into Economic_Indicators Table
INSERT INTO Economic_Indicators (country_id, year, gdp, inflation_rate, unemployment_rate, gdp_growth_rate)
VALUES 
(1, 2020, 50000.0, 2.5, 5.0, 3.0),
(2, 2020, 75000.0, 1.5, 4.0, 2.5);

-- Insert data into Population_Stats Table
INSERT INTO Population_Stats (country_id, year, total_population, urban_population_pct, age_0_14_pct, age_15_64_pct, age_65_plus_pct)
VALUES 
(1, 2020, 1000000, 60.0, 20.0, 65.0, 15.0),
(2, 2020, 2000000, 70.0, 18.0, 67.0, 15.0);

-- Insert data into Trade Table
INSERT INTO Trade (country_id, year, exports, imports)
VALUES 
(1, 2020, 10000.0, 8000.0),
(2, 2020, 15000.0, 12000.0);