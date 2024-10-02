-- Function to get the details of an employee
CREATE OR REPLACE FUNCTION get_employee_details(p_employee_id INT)
RETURNS TABLE(
    employee_id INT,
    first_name VARCHAR,
    last_name VARCHAR,
    position VARCHAR,
    branch_name VARCHAR,
    salary DECIMAL(10, 2),
    date_of_hire DATE,
    branch_id INT,
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT e.employee_id, e.first_name, e.last_name, e.position, b.branch_name,e.salary,e.date_of_hire,e.branch_id
    FROM Employees e
    JOIN Branches b ON e.branch_id = b.branch_id
    WHERE e.employee_id = employee_id;
END;
$$;

-- Function to get the salary of an employee
CREATE OR REPLACE FUNCTION calculate_employee_salary(p_employee_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT salary FROM Employees WHERE employee_id = employee_id);
END;
$$;
