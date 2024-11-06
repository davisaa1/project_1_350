-- Index on country name in the Country table
CREATE INDEX idx_country_name ON Country(name);

-- Indexes on the Economic_Indicators table
CREATE INDEX idx_economic_year_country ON Economic_Indicators(year, country_id);

-- Index on region in the Country table
CREATE INDEX idx_country_region ON Country(region);

-- Index on year and country_id in Trade table
CREATE INDEX idx_trade_year_country ON Trade(year, country_id);
