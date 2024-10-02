-- Function to get recent transactions for an account
CREATE OR REPLACE FUNCTION get_recent_transactions(account_id INT, limit INT)
RETURNS TABLE(
    transaction_id INT,
    amount DECIMAL,
    transaction_date TIMESTAMP,
    description VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT transaction_id, amount, transaction_date, description
    FROM Transactions
    WHERE account_id = account_id
    ORDER BY transaction_date DESC
    LIMIT limit;
END;
$$;

-- Function to calculate the total value of transactions for an account
CREATE OR REPLACE FUNCTION calculate_total_transactions(account_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT SUM(amount) FROM Transactions WHERE account_id = account_id);
END;
$$;

CREATE OR REPLACE FUNCTION get_account_transactions(p_account_id INT)
RETURNS TABLE (
    transaction_id INT,
    account_id INT,
    transaction_type transaction_type_enum,
    amount DECIMAL(15, 2),
    transaction_date TIMESTAMP,
    description VARCHAR(255)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT * 
    FROM Transactions 
    WHERE account_id = p_account_id 
    ORDER BY transaction_date DESC;
END;
$$;

