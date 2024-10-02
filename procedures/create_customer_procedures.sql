-- Add a new customer
CREATE OR REPLACE PROCEDURE add_customer(
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50),
    p_date_of_birth DATE,
    p_address VARCHAR(255),
    p_phone_number VARCHAR(15),
    p_email VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Customers (first_name, last_name, date_of_birth, address, phone_number, email, created_at, updated_at)
    VALUES (p_first_name, p_last_name, p_date_of_birth, p_address, p_phone_number, p_email, NOW(), NOW());
END;
$$;

-- Update an existing customer's details
CREATE OR REPLACE PROCEDURE update_customer(
    p_customer_id INT,
    p_first_name VARCHAR(50),
    p_last_name VARCHAR(50),
    p_address VARCHAR(255),
    p_phone_number VARCHAR(15),
    p_email VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Customers
    SET first_name = p_first_name,
        last_name = p_last_name,
        address = p_address,
        phone_number = p_phone_number,
        email = p_email,
        updated_at = NOW()
    WHERE customer_id = p_customer_id;
END;
$$;

-- Delete a customer by customer_id
CREATE OR REPLACE PROCEDURE delete_customer(p_customer_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Customers WHERE customer_id = p_customer_id;
END;
$$;
