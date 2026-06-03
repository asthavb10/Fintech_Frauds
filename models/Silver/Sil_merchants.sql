select
    merchant_id,
    trim(merchant_name) as merchant_name,
    trim(category) as category,
    trim(city) as city,
    trim(region) as region,
    mcc_code,
    risk_score,
    avg_transaction_uzs,
    is_online,
    years_registered
from {{ source('raw','merchants')}}
where merchant_id is NOT NULL