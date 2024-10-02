-- Issue a new loan to a customer
CREATE OR REPLACE PROCEDURE add_loan(
    p_customer_id INT,
    p_loan_type loan_type_enum,
    p_amount DECIMAL(15, 2),
    p_interest_rate DECIMAL(5, 2),
    p_start_date DATE,
    p_end_date DATE,
    p_status status_enum
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Loans (customer_id, loan_type, amount, interest_rate, start_date, end_date, status)
    VALUES (p_customer_id, p_loan_type, p_amount, p_interest_rate, p_start_date, p_end_date, p_status);
END;
$$;

-- Update the status of an existing loan
CREATE OR REPLACE PROCEDURE update_loan_status(
    p_loan_id INT,
    p_status status_enum
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Loans
    SET status = p_status
    WHERE loan_id = p_loan_id;
END;
$$;

-- Record a payment made towards a loan
CREATE OR REPLACE PROCEDURE add_loan_payment(
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
