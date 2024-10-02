-- Add a new branch to the Branches table
CREATE OR REPLACE PROCEDURE add_branch(
    p_branch_name VARCHAR(100),
    p_location VARCHAR(255),
    p_phone_number VARCHAR(15)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Branches (branch_name, location, phone_number)
    VALUES (p_branch_name, p_location, p_phone_number);
END;
$$;

-- Update the details of an existing branch
CREATE OR REPLACE PROCEDURE update_branch(
    p_branch_id INT,
    p_branch_name VARCHAR(100),
    p_location VARCHAR(255),
    p_phone_number VARCHAR(15)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Branches
    SET branch_name = p_branch_name,
        location = p_location,
        phone_number = p_phone_number,
        updated_at = NOW()
    WHERE branch_id = p_branch_id;
END;
$$;

-- Delete a branch from the system
CREATE OR REPLACE PROCEDURE delete_branch(p_branch_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Branches WHERE branch_id = p_branch_id;
END;
$$;
