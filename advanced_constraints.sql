-- Ensure the trade balance is always correct as exports - imports
ALTER TABLE Trade
ADD CONSTRAINT chk_trade_balance CHECK (trade_balance = exports - imports);

-- Adding a range constraint on inflation rate and unemployment rate in Economic Indicators
ALTER TABLE Economic_Indicators
ADD CONSTRAINT chk_inflation_rate CHECK (inflation_rate BETWEEN -50 AND 50),
ADD CONSTRAINT chk_unemployment_rate CHECK (unemployment_rate BETWEEN 0 AND 100);

-- Constraint to enforce realistic population percentages in Population Stats
ALTER TABLE Population_Stats
ADD CONSTRAINT chk_population_percentages
CHECK (urban_population_pct + age_0_14_pct + age_15_64_pct + age_65_plus_pct <= 100);