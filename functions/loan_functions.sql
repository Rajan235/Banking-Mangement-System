-- Function to get a summary of a loan
CREATE OR REPLACE FUNCTION get_loan_summary(loan_id INT)
RETURNS TABLE(
    loan_id INT,
    amount DECIMAL,
    interest_rate DECIMAL,
    start_date DATE,
    end_date DATE,
    status VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT loan_id, amount, interest_rate, start_date, end_date, status
    FROM Loans
    WHERE loan_id = loan_id;
END;
$$;

-- Function to calculate the remaining balance of a loan
CREATE OR REPLACE FUNCTION calculate_loan_balance(loan_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT amount - COALESCE(SUM(amount), 0) FROM Loans l
            LEFT JOIN Payments p ON l.loan_id = p.loan_id
            WHERE l.loan_id = loan_id
            GROUP BY l.loan_id);
END;
$$;
