-- Function to get an overview of a customer's information
CREATE OR REPLACE FUNCTION get_customer_overview(p_customer_id INT)
RETURNS TABLE(
    customer_id INT,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    date_of_birth DATE,
    address VARCHAR,
    phone_number VARCHAR,
    total_accounts INT,
    total_loans INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        c.email,
        c.date_of_birth,
        c.address,
        c.phone_number,
        COUNT(a.account_id) AS total_accounts,
        COUNT(l.loan_id) AS total_loans
    FROM Customers c
    LEFT JOIN Accounts a ON a.customer_id = c.customer_id
    LEFT JOIN Loans l ON l.customer_id = c.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.customer_id;
END;
$$;

