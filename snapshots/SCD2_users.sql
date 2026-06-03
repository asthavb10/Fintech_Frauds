{% snapshot users_snapshot %}

{{
    config(
        target_schema = 'SNAPSHOTS',
        unique_key='user_id',
        strategy='check',
        check_cols=[
            'city',
            'region',
            'preferred_device',
            'credit_score',
            'monthly_income_uzs'
        ]
    )
}}

select * 
from {{ ref('Sil_Users') }}

{% endsnapshot %}