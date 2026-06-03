SELECT

    t.user_id,

    u.city,
    u.region,
    u.preferred_device,

    COUNT(*) AS total_transactions,

    AVG(t.session_duration_sec) AS avg_session_duration,

    AVG(t.login_attempts) AS avg_login_attempts,

    SUM(
        CASE
            WHEN t.is_cross_city_tx = TRUE THEN 1
            ELSE 0
        END
    ) AS cross_city_transactions,

    SUM(
        CASE
            WHEN t.is_weekend = TRUE THEN 1
            ELSE 0
        END
    ) AS weekend_transactions,

    SUM(
        CASE
            WHEN t.channel = 'MOBILE'
            THEN 1
            ELSE 0
        END
    ) AS mobile_transactions,

    SUM(
        CASE
            WHEN t.channel = 'WEB'
            THEN 1
            ELSE 0
        END
    ) AS web_transactions

FROM {{ ref('Sil_Transactions') }} t

LEFT JOIN {{ ref('Sil_Users') }} u
    ON t.user_id = u.user_id

GROUP BY

    t.user_id,
    u.city,
    u.region,
    u.preferred_device


