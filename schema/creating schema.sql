CREATE TYPE account_type_enum AS ENUM ('Savings', 'Checking', 'Investment');
CREATE TYPE transaction_type_enum AS ENUM ('Deposit', 'Withdrawal', 'Transfer', 'Payment');
CREATE TYPE loan_type_enum AS ENUM ('Personal', 'Auto', 'Mortgage', 'Student');
CREATE TYPE status_enum AS ENUM ('Active', 'Inactive', 'Closed');
CREATE TYPE card_type_enum AS ENUM ('Credit', 'Debit', 'Prepaid');
CREATE TYPE position_enum AS ENUM ('Teller', 'Manager', 'Clerk', 'Analyst');

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY SERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Accounts (
    account_id SERIAL  PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE,
    customer_id INT,
    account_type account_type_enum,
    balance DECIMAL(15, 2),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY SERIAL,
    account_id INT,
    transaction_type transaction_type_enum,
    amount DECIMAL(15, 2),
    transaction_date TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY SERIAL,
    customer_id INT,
    loan_type loan_type_enum,
    amount DECIMAL(15, 2),
    interest_rate DECIMAL(5, 2),
    start_date DATE,
    end_date DATE,
    status status_enum,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY SERIAL,
    loan_id INT,
    amount DECIMAL(15, 2),
    payment_date TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY SERIAL,
    branch_name VARCHAR(100),
    location VARCHAR(255),
    phone_number VARCHAR(15)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY SERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position position_enum,
    salary DECIMAL(10, 2),
    date_of_hire DATE,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Bankers (
    banker_id INT PRIMARY KEY SERIAL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position position_enum,
    salary DECIMAL(10, 2),
    date_of_hire DATE,
    branch_id INT UNIQUE,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Cards (
    card_id INT PRIMARY KEY SERIAL,
    customer_id INT,
    account_id INT,
    card_number VARCHAR(20) UNIQUE,
    card_type card_type_enum,
    expiry_date DATE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

CREATE TABLE Card_Transactions (
    transaction_id INT PRIMARY KEY ,
    card_id INT,
    transaction_type transaction_type_enum,
    amount DECIMAL(15, 2),
    transaction_date TIMESTAMP,
    description VARCHAR(255),
    FOREIGN KEY (card_id) REFERENCES Cards(card_id)
);

CREATE TABLE Credit_Card_Details (
    credit_card_id INT PRIMARY KEY,
    credit_limit DECIMAL(15, 2),
    balance DECIMAL(15, 2),
    FOREIGN KEY (credit_card_id) REFERENCES Cards(card_id)
);

CREATE TABLE Services (
    service_id INT PRIMARY KEY SERIAL,
    service_name VARCHAR(50),
    description VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Customer_Services (
    customer_service_id INT PRIMARY KEY SERIAL,
    customer_id INT,
    service_id INT,
    subscription_date TIMESTAMP,
    status status_enum,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
