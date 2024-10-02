CREATE TABLE TransactionLogs (
    log_id SERIAL PRIMARY KEY,
    transaction_id INT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(15, 2),
    transaction_date TIMESTAMP,
    description VARCHAR(255),
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_transaction_details()
RETURNS TRIGGER 
LANGUAGE plpgsql	
AS $$
BEGIN
    INSERT INTO TransactionLogs (transaction_id, account_id, transaction_type, amount, transaction_date, description)
    VALUES (NEW.transaction_id, NEW.account_id, NEW.transaction_type, NEW.amount, NEW.transaction_date, NEW.description);
    RETURN NEW;
END;
$$ ;

CREATE TRIGGER log_transaction
AFTER INSERT ON Transactions
FOR EACH ROW
EXECUTE PROCEDURE log_transaction_details();