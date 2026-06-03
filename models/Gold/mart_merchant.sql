SELECT
    merchant_id,
    merchant_name,
    category,
    city,
    region,
    risk_score,
    total_transactions,
    fraud_transactions,
    fraud_rate_pct,
    avg_transaction_amount,
    max_transaction_amount
FROM {{ ref('int_merchant_risk') }}