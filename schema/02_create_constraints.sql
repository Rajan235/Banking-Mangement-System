-- Primary Key Constraints
ALTER TABLE Customers ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);
ALTER TABLE Accounts ADD CONSTRAINT pk_accounts PRIMARY KEY (account_id);
ALTER TABLE Transactions ADD CONSTRAINT pk_transactions PRIMARY KEY (transaction_id);
ALTER TABLE Loans ADD CONSTRAINT pk_loans PRIMARY KEY (loan_id);
ALTER TABLE Payments ADD CONSTRAINT pk_payments PRIMARY KEY (payment_id);
ALTER TABLE Branches ADD CONSTRAINT pk_branches PRIMARY KEY (branch_id);
ALTER TABLE Employees ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);
ALTER TABLE Bankers ADD CONSTRAINT pk_bankers PRIMARY KEY (banker_id);
ALTER TABLE Cards ADD CONSTRAINT pk_cards PRIMARY KEY (card_id);
ALTER TABLE Card_Transactions ADD CONSTRAINT pk_card_transactions PRIMARY KEY (transaction_id);
ALTER TABLE Credit_Card_Details ADD CONSTRAINT pk_credit_card_details PRIMARY KEY (credit_card_id);
ALTER TABLE Services ADD CONSTRAINT pk_services PRIMARY KEY (service_id);
ALTER TABLE Customer_Services ADD CONSTRAINT pk_customer_services PRIMARY KEY (customer_service_id);

-- Foreign Key Constraints
ALTER TABLE Accounts ADD CONSTRAINT fk_accounts_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Transactions ADD CONSTRAINT fk_transactions_account_id FOREIGN KEY (account_id) REFERENCES Accounts(account_id);
ALTER TABLE Loans ADD CONSTRAINT fk_loans_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Payments ADD CONSTRAINT fk_payments_loan_id FOREIGN KEY (loan_id) REFERENCES Loans(loan_id);
ALTER TABLE Employees ADD CONSTRAINT fk_employees_branch_id FOREIGN KEY (branch_id) REFERENCES Branches(branch_id);
ALTER TABLE Bankers ADD CONSTRAINT fk_bankers_branch_id FOREIGN KEY (branch_id) REFERENCES Branches(branch_id);
ALTER TABLE Cards ADD CONSTRAINT fk_cards_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Cards ADD CONSTRAINT fk_cards_account_id FOREIGN KEY (account_id) REFERENCES Accounts(account_id);
ALTER TABLE Card_Transactions ADD CONSTRAINT fk_card_transactions_card_id FOREIGN KEY (card_id) REFERENCES Cards(card_id);
ALTER TABLE Credit_Card_Details ADD CONSTRAINT fk_credit_card_details_credit_card_id FOREIGN KEY (credit_card_id) REFERENCES Cards(card_id);
ALTER TABLE Customer_Services ADD CONSTRAINT fk_customer_services_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Customer_Services ADD CONSTRAINT fk_customer_services_service_id FOREIGN KEY (service_id) REFERENCES Services(service_id);

-- Unique Constraints
ALTER TABLE Accounts ADD CONSTRAINT uq_accounts_account_number UNIQUE (account_number);
ALTER TABLE Cards ADD CONSTRAINT uq_cards_card_number UNIQUE (card_number);
ALTER TABLE Customers ADD CONSTRAINT uq_customers_email UNIQUE (email);

-- Check Constraints
ALTER TABLE Accounts ADD CONSTRAINT chk_accounts_balance CHECK (balance >= 0);
ALTER TABLE Credit_Card_Details ADD CONSTRAINT chk_credit_card_details_credit_limit CHECK (credit_limit >= 0);
ALTER TABLE Credit_Card_Details ADD CONSTRAINT chk_credit_card_details_balance CHECK (balance >= 0);
