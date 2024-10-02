-- View to list all active customers
CREATE OR REPLACE VIEW active_customers AS
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.account_type != 'inactive';

-- View to get an overview of customer data
CREATE OR REPLACE VIEW customer_overview AS
SELECT c.customer_id, c.first_name, c.last_name, c.email,
       COUNT(DISTINCT a.account_id) AS total_accounts,
       COUNT(DISTINCT l.loan_id) AS total_loans
FROM Customers c
LEFT JOIN Accounts a ON c.customer_id = a.customer_id
LEFT JOIN Loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email;
