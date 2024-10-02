-- Record a new transaction for an account
CREATE OR REPLACE PROCEDURE add_transaction(
    p_account_id INT,
    p_transaction_type transaction_type_enum,
    p_amount DECIMAL(15, 2),
    p_description VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date, description)
    VALUES (p_account_id, p_transaction_type, p_amount, NOW(), p_description);
END;
$$;

-- Reverse a specific transaction
CREATE OR REPLACE PROCEDURE reverse_transaction(p_transaction_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Transactions WHERE transaction_id = p_transaction_id;
END;
$$;

-- Retrieve all transactions for a specific account

