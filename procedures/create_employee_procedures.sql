-- Add a new employee to the Employees table
CREATE OR REPLACE PROCEDURE add_employee(
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50),
    p_position position_enum,
    p_salary DECIMAL(10, 2),
    p_branch_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employees (first_name, last_name, position, salary, date_of_hire, branch_id)
    VALUES (p_first_name, p_last_name, p_position, p_salary, NOW(), p_branch_id);
END;
$$;

-- Update the salary of an existing employee
CREATE OR REPLACE PROCEDURE update_employee_salary(
    p_employee_id INT,
    p_salary DECIMAL(10, 2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employees
    SET salary = p_salary,
        updated_at = NOW()
    WHERE employee_id = p_employee_id;
END;
$$;

-- Remove an employee from the system
CREATE OR REPLACE PROCEDURE delete_employee(p_employee_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employees WHERE employee_id = p_employee_id;
END;
$$;
