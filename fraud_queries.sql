USE banking_fraud;

-- 1️⃣ Large Transactions (> 50,000)
SELECT 
    t.transaction_id,
    c.full_name,
    t.amount,
    t.transaction_time
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE t.amount > 50000;


-- 2️⃣ Rapid Transactions Within 10 Minutes (Suspicious)
WITH ranked_transactions AS (
    SELECT 
        transaction_id,
        account_id,
        transaction_time,
        amount,
        LAG(transaction_time) OVER (
            PARTITION BY account_id 
            ORDER BY transaction_time
        ) AS previous_time
    FROM transactions
)
SELECT *
FROM ranked_transactions
WHERE TIMESTA
