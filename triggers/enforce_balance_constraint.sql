CREATE OR REPLACE FUNCTION raise_exception()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE EXCEPTION 'Account balance cannot be negative';
    RETURN NULL;  -- Return NULL to indicate that the operation should not proceed
END;
$$;


CREATE TRIGGER enforce_balance_constraint
BEFORE UPDATE ON Accounts
FOR EACH ROW
WHEN (NEW.balance < 0)
EXECUTE PROCEDURE raise_exception();