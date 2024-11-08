
-- Procedure to create a new yearly partition for the Trade table
CREATE OR REPLACE FUNCTION create_yearly_trade_partition(target_year INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE format(
        'CREATE TABLE IF NOT EXISTS Trade%s PARTITION OF Trade FOR VALUES FROM (%s) TO (%s)',
        target_year, target_year, target_year + 1
    );
END;
$$ LANGUAGE plpgsql;

-- Automate partition creation for next year
DO $$
DECLARE
    next_year INT := EXTRACT(YEAR FROM CURRENT_DATE) + 1;
BEGIN
    PERFORM create_yearly_trade_partition(next_year);
END $$;

