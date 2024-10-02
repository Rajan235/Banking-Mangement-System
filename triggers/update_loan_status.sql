
CREATE OR REPLACE FUNCTION check_loan_status()
RETURNS TRIGGER 
LANGUAGE plpgsql	
AS $$
BEGIN
    IF NEW.end_date < NOW() THEN
        UPDATE Loans
        SET status = 'Completed'
        WHERE loan_id = NEW.loan_id;
    END IF;
    RETURN NEW;
END;
$$ ;

CREATE TRIGGER update_loan_status
AFTER UPDATE OF end_date ON Loans
FOR EACH ROW
EXECUTE PROCEDURE check_loan_status();
