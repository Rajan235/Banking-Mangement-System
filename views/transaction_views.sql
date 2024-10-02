-- View to get the most recent transactions for all accounts
CREATE OR REPLACE VIEW recent_transactions AS
SELECT t.transaction_id, t.account_id, t.amount, t.transaction_date, t.description
FROM Transactions t
ORDER BY t.transaction_date DESC
LIMIT 50;


