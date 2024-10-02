-- View to get account balances with customer details
CREATE OR REPLACE VIEW account_balances AS
SELECT a.account_id, a.account_number, a.balance, c.first_name, c.last_name
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id;

-- View to get a summary of all accounts
CREATE OR REPLACE VIEW account_summary AS
SELECT a.account_id, a.account_number, a.account_type, a.balance,
       c.first_name, c.last_name, c.email
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id;
