Select 
     user_id,
    name,
    gender,
    age,
    city,
    region,
    registration_date,
    primary_app,
    preferred_device,
    credit_score,
    monthly_income_uzs,
    identity_verified,
    historical_tx_count
from {{ ref('Sil_Users') }}