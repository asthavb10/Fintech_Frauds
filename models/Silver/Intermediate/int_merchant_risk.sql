SELECT

    t.merchant_id,

    m.merchant_name,
    m.category,
    m.city,
    m.region,
    m.risk_score,
    m.is_online,

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

LEFT JOIN {{ ref('Sil_merchants') }} m
    ON t.merchant_id = m.merchant_id

GROUP BY

    t.merchant_id,

    m.merchant_name,
    m.category,
    m.city,
    m.region,
    m.risk_score,
    m.is_online


