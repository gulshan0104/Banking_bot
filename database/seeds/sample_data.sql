USE banking_db;

INSERT INTO users (username, email, password_hash, first_name, last_name, phone, location, role, is_active, is_verified) 
VALUES 
('john_doe', 'john@example.com', '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86E36P4/tvJi', 'John', 'Doe', '9876543210', 'New York', 'user', TRUE, TRUE),
('jane_smith', 'jane@example.com', '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86E36P4/tvJi', 'Jane', 'Smith', '9876543211', 'Los Angeles', 'manager', TRUE, TRUE),
('mike_johnson', 'mike@example.com', '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcg7b3XeKeUxWdeS86E36P4/tvJi', 'Mike', 'Johnson', '9876543212', 'Chicago', 'user', TRUE, TRUE);

INSERT INTO banking_data (user_id, account_holder_name, account_number, account_type, bank_name, ifsc_code, location, country, balance, currency, account_status, opening_date, phone_number, email_address)
VALUES
(1, 'John Doe', '1234567890123', 'savings', 'Chase Bank', 'CHASUS33', 'New York', 'USA', 50000.00, 'USD', 'active', '2020-01-15', '9876543210', 'john@example.com'),
(1, 'John Doe', '9876543210987', 'checking', 'Chase Bank', 'CHASUS33', 'New York', 'USA', 15000.00, 'USD', 'active', '2021-03-20', '9876543210', 'john@example.com'),
(2, 'Jane Smith', '5555666677778', 'business', 'Bank of America', 'BOFAUS3N', 'Los Angeles', 'USA', 100000.00, 'USD', 'active', '2019-06-10', '9876543211', 'jane@example.com'),
(3, 'Mike Johnson', '1111222233334', 'investment', 'Wells Fargo', 'WFBIUS6S', 'Chicago', 'USA', 250000.00, 'USD', 'active', '2018-11-05', '9876543212', 'mike@example.com');

INSERT INTO transactions (banking_data_id, transaction_type, amount, description, reference_number, status, transaction_date, balance_after)
VALUES
(1, 'deposit', 5000.00, 'Salary Deposit', 'TXN001', 'completed', NOW() - INTERVAL 5 DAY, 55000.00),
(1, 'withdrawal', 500.00, 'ATM Withdrawal', 'TXN002', 'completed', NOW() - INTERVAL 3 DAY, 54500.00),
(1, 'transfer', 1000.00, 'Transfer to checking', 'TXN003', 'completed', NOW() - INTERVAL 1 DAY, 53500.00),
(2, 'deposit', 2000.00, 'Transfer from savings', 'TXN004', 'completed', NOW() - INTERVAL 1 DAY, 17000.00),
(3, 'payment', 500.00, 'Bill Payment', 'TXN005', 'completed', NOW(), 99500.00),
(4, 'interest', 150.00, 'Monthly Interest', 'TXN006', 'completed', NOW() - INTERVAL 10 DAY, 250150.00);