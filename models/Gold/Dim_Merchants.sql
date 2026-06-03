select
    merchant_id,
    merchant_name,
    category,
    city,
    region,
    mcc_code,
    risk_score,
    avg_transaction_uzs,
    is_online,
    years_registered

from {{ ref('Sil_merchants') }}