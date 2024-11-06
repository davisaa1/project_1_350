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
    gdp FLOAT,
    inflation_rate FLOAT,
    unemployment_rate FLOAT,
    gdp_growth_rate FLOAT
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

-- Trade Table (Partitioned)
CREATE TABLE Trade (
    trade_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Country(country_id) ON DELETE CASCADE,
    year INT CHECK (year >= 1900 AND year <= 2100),
    exports FLOAT,
    imports FLOAT,
    trade_balance FLOAT GENERATED ALWAYS AS (exports - imports) STORED
) PARTITION BY RANGE (year);

-- Initial Partitions for Trade Table
CREATE TABLE Trade_2020 PARTITION OF Trade FOR VALUES FROM (2020) TO (2021);
CREATE TABLE Trade_2021 PARTITION OF Trade FOR VALUES FROM (2021) TO (2022);
CREATE TABLE Trade_2022 PARTITION OF Trade FOR VALUES FROM (2022) TO (2023);
