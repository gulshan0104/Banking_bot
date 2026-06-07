# Banking Bot - Database Documentation

## Tables

### users
- id (INT, PRIMARY KEY)
- username (VARCHAR, UNIQUE)
- email (VARCHAR, UNIQUE)
- password_hash (VARCHAR)
- first_name, last_name (VARCHAR)
- role (ENUM: admin, manager, user)
- is_active, is_verified (BOOLEAN)
- created_at, updated_at (TIMESTAMP)

### banking_data
- id (INT, PRIMARY KEY)
- user_id (INT, FOREIGN KEY)
- account_holder_name (VARCHAR)
- account_number (VARCHAR, UNIQUE)
- account_type (ENUM: savings, checking, business, investment)
- bank_name, location, country (VARCHAR)
- balance (DECIMAL)
- account_status (ENUM: active, inactive, closed, frozen)

### transactions
- id (INT, PRIMARY KEY)
- banking_data_id (INT, FOREIGN KEY)
- transaction_type (ENUM: deposit, withdrawal, transfer, payment, interest)
- amount (DECIMAL)
- status (ENUM: pending, completed, failed, reversed)
- transaction_date (TIMESTAMP)

### chatbot_conversations
- id (INT, PRIMARY KEY)
- user_id (INT, FOREIGN KEY)
- title, status (VARCHAR)
- created_at, updated_at (TIMESTAMP)

### chatbot_messages
- id (INT, PRIMARY KEY)
- conversation_id (INT, FOREIGN KEY)
- sender (ENUM: user, bot)
- message (TEXT)
- confidence_score (DECIMAL)
- created_at (TIMESTAMP)