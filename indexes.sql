USE banking_fraud;

-- Index for faster transaction queries by account
CREATE INDEX idx_account_id ON transactions(account_id);

-- Index for faster queries by transaction time
CREATE INDEX idx_transaction_time ON transactions(transaction_time);

-- Index for faster queries by amount
CREATE INDEX idx_amount ON transactions(amount);
