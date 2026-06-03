select 
    user_id,
    TRIM(name) as name,
    case 
        when upper(trim(gender)) in ('M','MALE')
            THEN 'MALE'
        WHEN UPPER(trim(gender)) in ('F','FEMALE')
            THEN 'FEMALE'
        ELSE 'UNKNOWN'
    END AS gender,
    age,
    INITCAP(TRIM(city)) AS city,
    INITCAP(TRIM(region)) AS region,
    registration_date,
    trim(primary_app) as primary_app,
    trim(preferred_device) as preferred_device,
    credit_score,
    monthly_income_uzs,
    identity_verified,
    historical_tx_count
from {{ source('raw','users') }}
where user_id is NOT NULL