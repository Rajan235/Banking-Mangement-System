-- Insert data into Customers
INSERT INTO Customers (customer_id, first_name, last_name, date_of_birth, address, phone_number, email, created_at, updated_at)
VALUES
(1, 'John', 'Doe', '1985-06-15', '123 Elm St, Springfield, IL', '555-1234', 'john.doe@example.com', NOW(), NOW()),
(2, 'Jane', 'Smith', '1990-04-20', '456 Oak St, Springfield, IL', '555-5678', 'jane.smith@example.com', NOW(), NOW()),
(3, 'Alice', 'Johnson', '1988-08-30', '789 Pine St, Springfield, IL', '555-8765', 'alice.johnson@example.com', NOW(), NOW()),
(4, 'Bob', 'Brown', '1975-02-25', '321 Maple St, Springfield, IL', '555-4321', 'bob.brown@example.com', NOW(), NOW()),
(5, 'Charlie', 'Davis', '2000-12-12', '654 Birch St, Springfield, IL', '555-2468', 'charlie.davis@example.com', NOW(), NOW());

-- Insert data into Accounts
INSERT INTO Accounts (account_id, account_number, customer_id, account_type, balance, created_at, updated_at)
VALUES
(1, 'ACC1001', 1, 'Savings', 1500.00, NOW(), NOW()),
(2, 'ACC1002', 1, 'Checking', 2500.00, NOW(), NOW()),
(3, 'ACC1003', 2, 'Investment', 3000.00, NOW(), NOW()),
(4, 'ACC1004', 3, 'Savings', 1200.00, NOW(), NOW()),
(5, 'ACC1005', 4, 'Checking', 400.00, NOW(), NOW());

-- Insert data into Transactions
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date, description)
VALUES
(1, 1, 'Deposit', 500.00, NOW(), 'Initial deposit'),
(2, 2, 'Withdrawal', 200.00, NOW(), 'ATM withdrawal'),
(3, 3, 'Transfer', 1500.00, NOW(), 'Transfer to savings'),
(4, 4, 'Deposit', 600.00, NOW(), 'Deposit from paycheck'),
(5, 5, 'Payment', 100.00, NOW(), 'Bill payment');

-- Insert data into Loans
INSERT INTO Loans (loan_id, customer_id, loan_type, amount, interest_rate, start_date, end_date, status)
VALUES
(1, 1, 'Personal', 5000.00, 5.0, '2021-01-01', '2025-01-01', 'Active'),
(2, 2, 'Auto', 15000.00, 3.5, '2020-03-15', '2025-03-15', 'Active'),
(3, 3, 'Mortgage', 250000.00, 4.5, '2018-06-01', '2048-06-01', 'Active'),
(4, 4, 'Student', 20000.00, 4.0, '2022-09-01', '2025-09-01', 'Inactive'),
(5, 5, 'Personal', 10000.00, 6.0, '2023-02-15', '2026-02-15', 'Active');

-- Insert data into Payments
INSERT INTO Payments (payment_id, loan_id, amount, payment_date, description)
VALUES
(1, 1, 1000.00, NOW(), 'Monthly payment'),
(2, 2, 300.00, NOW(), 'Monthly payment'),
(3, 3, 1200.00, NOW(), 'Monthly payment'),
(4, 4, 200.00, NOW(), 'Monthly payment'),
(5, 5, 400.00, NOW(), 'Monthly payment');

-- Insert data into Branches
INSERT INTO Branches (branch_id, branch_name, location, phone_number)
VALUES
(1, 'Downtown Branch', '123 Main St, Springfield, IL', '555-1111'),
(2, 'Northside Branch', '456 North St, Springfield, IL', '555-2222'),
(3, 'Southside Branch', '789 South St, Springfield, IL', '555-3333'),
(4, 'Westside Branch', '321 West St, Springfield, IL', '555-4444'),
(5, 'Eastside Branch', '654 East St, Springfield, IL', '555-5555');

-- Insert data into Employees
INSERT INTO Employees (employee_id, first_name, last_name, position, salary, date_of_hire, branch_id)
VALUES
(1, 'Nancy', 'Wilson', 'Teller', 35000.00, '2019-01-15', 1),
(2, 'Tom', 'Green', 'Manager', 60000.00, '2018-05-20', 2),
(3, 'Emily', 'White', 'Clerk', 28000.00, '2020-03-10', 3),
(4, 'George', 'Black', 'Analyst', 55000.00, '2021-07-18', 4),
(5, 'Sophie', 'Martinez', 'Teller', 36000.00, '2020-11-22', 5);

-- Insert data into Bankers
INSERT INTO Bankers (banker_id, first_name, last_name, position, salary, date_of_hire, branch_id)
VALUES
(1, 'Laura', 'Taylor', 'Manager', 70000.00, '2017-04-01', 1),
(2, 'Mike', 'Jones', 'Manager', 72000.00, '2016-08-15', 2),
(3, 'Jessica', 'Garcia', 'Manager', 74000.00, '2015-12-20', 3),
(4, 'David', 'Lopez', 'Manager', 75000.00, '2014-09-10', 4),
(5, 'Anna', 'Hernandez', 'Manager', 76000.00, '2013-06-30', 5);

-- Insert data into Cards
INSERT INTO Cards (card_id, customer_id, account_id, card_number, card_type, expiry_date, created_at, updated_at)
VALUES
(1, 1, 1, 'CARD10001', 'Credit', '2025-05-01', NOW(), NOW()),
(2, 2, 3, 'CARD10002', 'Debit', '2024-12-01', NOW(), NOW()),
(3, 3, 4, 'CARD10003', 'Prepaid', '2026-08-01', NOW(), NOW()),
(4, 4, 5, 'CARD10004', 'Credit', '2023-11-01', NOW(), NOW()),
(5, 5, 2, 'CARD10005', 'Debit', '2024-03-01', NOW(), NOW());

-- Insert data into Card_Transactions
INSERT INTO Card_Transactions (transaction_id, card_id, transaction_type, amount, transaction_date, description)
VALUES
(1, 1, 'Deposit', 200.00, NOW(), 'Deposit at ATM'),
(2, 2, 'Withdrawal', 50.00, NOW(), 'Grocery store purchase'),
(3, 3, 'Payment', 15.00, NOW(), 'Online subscription'),
(4, 4, 'Transfer', 100.00, NOW(), 'Transfer to another account'),
(5, 5, 'Deposit', 75.00, NOW(), 'Cash deposit');

-- Insert data into Credit_Card_Details
INSERT INTO Credit_Card_Details (credit_card_id, credit_limit, balance)
VALUES
(1, 5000.00, 1500.00),
(2, 3000.00, 2500.00),
(3, 2000.00, 1200.00),
(4, 1000.00, 400.00),
(5, 4000.00, 200.00);

-- Insert data into Services
INSERT INTO Services (service_id, service_name, description, created_at, updated_at)
VALUES
(1, 'Online Banking', 'Access your accounts online', NOW(), NOW()),
(2, 'Mobile App', 'Manage your banking on the go', NOW(), NOW()),
(3, 'Financial Advisory', 'Personalized financial advice', NOW(), NOW()),
(4, 'Loan Services', 'Apply for various types of loans', NOW(), NOW()),
(5, 'Investment Services', 'Investment planning and management', NOW(), NOW());

-- Insert data into Customer_Services
INSERT INTO Customer_Services (customer_service_id, customer_id, service_id, subscription_date, status)
VALUES
(1, 1, 1, NOW(), 'Active'),
(2, 2, 2, NOW(), 'Active'),
(3, 3, 3, NOW(), 'Inactive'),
(4, 4, 4, NOW(), 'Active'),
(5, 5, 5, NOW(), 'Active');
