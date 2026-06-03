SELECT
    COUNT(*) AS total_transactions,
    SUM(
        CASE
            WHEN is_fraud = TRUE THEN 1
            ELSE 0
        END
    ) AS fraud_transactions,
    ROUND(
        SUM(
            CASE
                WHEN is_fraud = TRUE THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS fraud_rate_pct,
    SUM(amount_uzs) AS total_transaction_amount,
    SUM(
        CASE
            WHEN is_fraud = TRUE
            THEN amount_uzs
            ELSE 0
        END
    ) AS fraudulent_amount,
    AVG(amount_uzs) AS avg_transaction_amount
FROM {{ ref('fact_transactions') }}