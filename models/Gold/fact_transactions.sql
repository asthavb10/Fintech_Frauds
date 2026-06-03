select
    tx_id,
    timestamp,
    user_id,
    merchant_id,
    amount_uzs,
    channel,
    hour_of_day,
    day_of_week,
    is_weekend,
    session_duration_sec,
    login_attempts,
    is_cross_city_tx,
    is_fraud
from {{ ref('Sil_Transactions') }}