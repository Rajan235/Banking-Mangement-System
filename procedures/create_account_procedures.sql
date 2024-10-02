-- Add a new account for a customer
CREATE OR REPLACE PROCEDURE add_account(
    p_customer_id INT,
    p_account_number VARCHAR(20),
    p_account_type account_type_enum,
    p_balance DECIMAL(15, 2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Accounts (customer_id, account_number, account_type, balance, created_at, updated_at)
    VALUES (p_customer_id, p_account_number, p_account_type, p_balance, NOW(), NOW());
END;
$$;

-- Update the balance of an account
CREATE OR REPLACE PROCEDURE update_account_balance(
    p_account_id INT,
    p_balance DECIMAL(15, 2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Accounts
    SET balance = p_balance,
        updated_at = NOW()
    WHERE account_id = p_account_id;
END;
$$;

-- Close an account by setting its status
CREATE OR REPLACE PROCEDURE close_account(p_account_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Accounts
    SET account_type = 'inactive',
        updated_at = NOW()
    WHERE account_id = p_account_id;
END;
$$;
