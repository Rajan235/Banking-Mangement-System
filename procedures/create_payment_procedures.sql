-- Record a payment for a loan
CREATE OR REPLACE PROCEDURE add_payment(
    p_loan_id INT,
    p_amount DECIMAL(15, 2),
    p_description VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Payments (loan_id, amount, payment_date, description)
    VALUES (p_loan_id, p_amount, NOW(), p_description);
END;
$$;

-- Update an existing payment
CREATE OR REPLACE PROCEDURE update_payment(
    p_payment_id INT,
    p_amount DECIMAL(15, 2),
    p_description VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Payments
    SET amount = p_amount,
        description = p_description,
        updated_at = NOW()
    WHERE payment_id = p_payment_id;
END;
$$;

-- Delete a payment record
CREATE OR REPLACE PROCEDURE delete_payment(p_payment_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Payments WHERE payment_id = p_payment_id;
END;
$$;
