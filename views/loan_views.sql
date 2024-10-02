-- View to list all active loans with customer details
CREATE OR REPLACE VIEW active_loans AS
SELECT l.loan_id, l.amount, l.interest_rate, l.start_date, l.end_date, c.first_name, c.last_name,c.customer_id
FROM Loans l
JOIN Customers c ON l.customer_id = c.customer_id
WHERE l.status = 'Active';

-- View to get a summary of all loans with customer details
CREATE OR REPLACE VIEW loan_summary AS
SELECT l.loan_id, l.amount, l.interest_rate, l.start_date, l.end_date, l.status,
       c.first_name, c.last_name, c.email,c.customer_id
FROM Loans l
JOIN Customers c ON l.customer_id = c.customer_id;