CREATE TABLE AccountChangeLogs (
    log_id SERIAL PRIMARY KEY,
    account_id INT,
    old_balance DECIMAL(15, 2),
    new_balance DECIMAL(15, 2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_account_changes()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO AccountChangeLogs (account_id, old_balance, new_balance)
    VALUES (OLD.account_id, OLD.balance, NEW.balance);
    RETURN NEW;
END;
$$ ;

CREATE TRIGGER log_account_changes
AFTER UPDATE ON Accounts
FOR EACH ROW
WHEN (OLD.balance IS DISTINCT FROM NEW.balance)
EXECUTE FUNCTION log_account_changes();