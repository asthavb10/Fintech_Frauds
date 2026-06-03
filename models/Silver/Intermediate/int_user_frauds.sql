SELECT

    t.user_id,

    u.city,
    u.region,
    u.gender,
    u.age,
    u.credit_score,
    u.monthly_income_uzs,

    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN t.is_fraud = TRUE THEN 1
            ELSE 0
        END
    ) AS fraud_transactions,

    ROUND(
        SUM(
            CASE
                WHEN t.is_fraud = TRUE THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS fraud_rate_pct,

    AVG(t.amount_uzs) AS avg_transaction_amount,

    MAX(t.amount_uzs) AS max_transaction_amount

FROM {{ ref('Sil_Transactions') }} t

LEFT JOIN {{ ref('Sil_Users') }} u
    ON t.user_id = u.user_id

GROUP BY

    t.user_id,
    u.city,
    u.region,
    u.gender,
    u.age,
    u.credit_score,
    u.monthly_income_uzs


