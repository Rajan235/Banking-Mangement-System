-- Function to get the balance of an account
CREATE OR REPLACE FUNCTION get_account_balance(p_account_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT balance FROM Accounts WHERE account_id = account_id);
END;
$$;
