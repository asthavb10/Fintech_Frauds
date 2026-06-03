SELECT
    uf.user_id,
    uf.city,
    uf.region,
    uf.age,
    uf.gender,
    uf.credit_score,
    uf.monthly_income_uzs,
    uf.total_transactions,
    uf.fraud_transactions,
    uf.fraud_rate_pct,
    uf.avg_transaction_amount,
    uf.max_transaction_amount,
    ub.avg_session_duration,
    ub.avg_login_attempts,
    ub.cross_city_transactions,
    ub.weekend_transactions,
    ub.mobile_transactions,
    ub.web_transactions
FROM {{ ref('int_user_frauds') }} uf
LEFT JOIN {{ ref('int_user_behaviour') }} ub
    ON uf.user_id = ub.user_id