-- Country Table
CREATE TABLE Country (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    region VARCHAR(100),
    sub_region VARCHAR(100),
    population INT,
    area_km2 FLOAT,
    currency VARCHAR(50),
    capital VARCHAR(100)
);

-- Economic Indicators Table
CREATE TABLE Economic_Indicators (
    indicator_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Country(country_id) ON DELETE CASCADE,
    year INT CHECK (year >= 1900 AND year <= 2100),
    gdp FLOAT,  -- GDP in billions of USD
    inflation_rate FLOAT,  -- Percentage
    unemployment_rate FLOAT,  -- Percentage
    gdp_growth_rate FLOAT  -- Percentage
);

-- Population Stats Table
CREATE TABLE Population_Stats (
    stat_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Country(country_id) ON DELETE CASCADE,
    year INT CHECK (year >= 1900 AND year <= 2100),
    total_population INT,
    urban_population_pct FLOAT CHECK (urban_population_pct >= 0 AND urban_population_pct <= 100),
    age_0_14_pct FLOAT CHECK (age_0_14_pct >= 0 AND age_0_14_pct <= 100),
    age_15_64_pct FLOAT CHECK (age_15_64_pct >= 0 AND age_15_64_pct <= 100),
    age_65_plus_pct FLOAT CHECK (age_65_plus_pct >= 0 AND age_65_plus_pct <= 100)
);

-- Trade Table
CREATE TABLE Trade (
    trade_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Country(country_id) ON DELETE CASCADE,
    year INT CHECK (year >= 1900 AND year <= 2100),
    exports FLOAT,  -- Exports in billions of USD
    imports FLOAT,  -- Imports in billions of USD
    trade_balance FLOAT GENERATED ALWAYS AS (exports - imports) STORED  -- Auto-calculated balance
);

-- Government Table
CREATE TABLE Government (
    gov_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Country(country_id) ON DELETE CASCADE,
    year INT CHECK (year >= 1900 AND year <= 2100),
    political_stability_index FLOAT CHECK (political_stability_index >= -2.5 AND political_stability_index <= 2.5),
    corruption_index FLOAT CHECK (corruption_index >= 0 AND corruption_index <= 100)
);

-- Geography Table
CREATE TABLE Geography (
    geo_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Country(country_id) ON DELETE CASCADE,
    climate VARCHAR(100),
    region_classification VARCHAR(50),  -- e.g., Developed, Developing
    natural_resources VARCHAR(255)
);