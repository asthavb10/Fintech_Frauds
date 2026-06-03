select
    tx_id,
    timestamp,
    user_id,
    merchant_id,
    amount_uzs,
    channel,
    session_duration_sec,
    login_attempts,
    is_cross_city_tx
from {{ ref('Sil_Transactions') }}
where is_fraud = true