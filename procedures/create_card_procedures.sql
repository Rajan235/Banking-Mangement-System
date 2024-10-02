-- Issue a new card to a customer
CREATE OR REPLACE PROCEDURE add_card(
    p_customer_id INT,
    p_account_id INT,
    p_card_number VARCHAR(20),
    p_card_type card_type_enum,
    p_expiry_date DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Cards (customer_id, account_id, card_number, card_type, expiry_date, created_at, updated_at)
    VALUES (p_customer_id, p_account_id, p_card_number, p_card_type, p_expiry_date, NOW(), NOW());
END;
$$;

-- Update the status (active/inactive) of a card
CREATE OR REPLACE PROCEDURE update_card_status(
    p_card_id INT,
    p_status status_enum
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Cards
    SET updated_at = NOW()
    WHERE card_id = p_card_id;
END;
$$;

-- Record a transaction made using a card
CREATE OR REPLACE PROCEDURE record_card_transaction(
    p_card_id INT,
    p_transaction_type transaction_type_enum,
    p_amount DECIMAL(15, 2),
    p_description VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Card_Transactions (card_id, transaction_type, amount, transaction_date, description)
    VALUES (p_card_id, p_transaction_type, p_amount, NOW(), p_description);
END;
$$;
