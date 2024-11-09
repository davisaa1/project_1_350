-- Import data into Country Table
BULK INSERT Country
FROM 'path/to/your/csv/Country.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Import data into Economic_Indicators Table
BULK INSERT Economic_Indicators
FROM 'path/to/your/csv/Economic_Indicators.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Import data into Population_Stats Table
BULK INSERT Population_Stats
FROM 'path/to/your/csv/Population_Stats.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Import data into Trade Table
BULK INSERT Trade
FROM 'path/to/your/csv/Trade.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);