-- Add a new service to the Services table
CREATE OR REPLACE PROCEDURE add_service(
    p_service_name VARCHAR(50),
    p_description VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Services (service_name, description, created_at, updated_at)
    VALUES (p_service_name, p_description, NOW(), NOW());
END;
$$;

-- Subscribe a customer to a specific service
CREATE OR REPLACE PROCEDURE subscribe_customer_to_service(
    p_customer_id INT,
    p_service_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Customer_Services (customer_id, service_id, subscription_date, status)
    VALUES (p_customer_id, p_service_id, NOW(), 'active');
END;
$$;

-- Unsubscribe a customer from a service
CREATE OR REPLACE PROCEDURE unsubscribe_customer_from_service(
    p_customer_service_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Customer_Services
    SET status = 'inactive',
        updated_at = NOW()
    WHERE customer_service_id = p_customer_service_id;
END;
$$;
