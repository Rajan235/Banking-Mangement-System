-- Indexes for faster lookup on frequently queried columns

-- Index on Customers to speed up email searches
CREATE INDEX idx_customers_email ON Customers(email);

-- Index on Accounts for faster customer_id lookups
CREATE INDEX idx_accounts_customer_id ON Accounts(customer_id);

-- Index on Transactions for faster account_id lookups
CREATE INDEX idx_transactions_account_id ON Transactions(account_id);

-- Index on Loans for faster customer_id lookups
CREATE INDEX idx_loans_customer_id ON Loans(customer_id);

-- Index on Payments for faster loan_id lookups
CREATE INDEX idx_payments_loan_id ON Payments(loan_id);

-- Index on Employees for faster branch_id lookups
CREATE INDEX idx_employees_branch_id ON Employees(branch_id);

-- Index on Cards for faster customer_id and account_id lookups
CREATE INDEX idx_cards_customer_id ON Cards(customer_id);
CREATE INDEX idx_cards_account_id ON Cards(account_id);

-- Index on Card_Transactions for faster card_id lookups
CREATE INDEX idx_card_transactions_card_id ON Card_Transactions(card_id);

-- Index on Customer_Services for faster customer_id and service_id lookups
CREATE INDEX idx_customer_services_customer_id ON Customer_Services(customer_id);
CREATE INDEX idx_customer_services_service_id ON Customer_Services(service_id);
