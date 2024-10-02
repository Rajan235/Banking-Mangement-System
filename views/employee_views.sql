-- View to get details of all employees, including branch and position
CREATE OR REPLACE VIEW employee_details AS
SELECT e.employee_id, e.first_name, e.last_name, e.position, b.branch_name
FROM Employees e
JOIN Branches b ON e.branch_id = b.branch_id;

-- View to list employees along with their salaries and branch details
CREATE OR REPLACE VIEW employee_salaries AS
SELECT e.employee_id, e.first_name, e.last_name, e.salary, b.branch_name
FROM Employees e
JOIN Branches b ON e.branch_id = b.branch_id
ORDER BY e.salary DESC;
