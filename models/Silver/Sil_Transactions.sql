SELECT
    TRIM(tx_id) AS tx_id,
    timestamp,
    user_id,
    merchant_id,
    amount_uzs,
    UPPER(TRIM(channel)) AS channel,
    hour_of_day,
    day_of_week,
    is_weekend,
    session_duration_sec,
    login_attempts,
    is_cross_city_tx,
    is_fraud
FROM {{ source('raw','transactions') }}
WHERE tx_id IS NOT NULL        
  AND user_id IS NOT NULL        
  AND merchant_id IS NOT NULL
