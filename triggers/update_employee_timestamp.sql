CREATE OR REPLACE FUNCTION update_employee_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_employee_timestamp
BEFORE UPDATE ON Employees
FOR EACH ROW
EXECUTE FUNCTION update_employee_timestamp();