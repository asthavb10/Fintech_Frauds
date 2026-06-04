create or replace warehouse Fintech_WH
with 
warehouse_size = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;

create database Fintech;
create schema raw;
create schema Silver;
create schema Gold;
USE WAREHOUSE FINTECH_WH;
use database Fintech;
use schema raw;

--=========================TABLE CREATION===========================================

CREATE OR REPLACE TABLE merchants (
    merchant_id STRING PRIMARY KEY,
    merchant_name STRING,
    category STRING,
    city STRING,
    region STRING,
    mcc_code INT,
    risk_score FLOAT,
    avg_transaction_uzs NUMBER(18,2),
    is_online BOOLEAN,
    years_registered INT
);


CREATE OR REPLACE TABLE users (
    user_id STRING PRIMARY KEY,
    name STRING,
    gender STRING,
    age INT,
    city STRING,
    region STRING,
    registration_date DATE,
    primary_app STRING,
    preferred_device STRING,
    credit_score INT,
    monthly_income_uzs NUMBER(18,2),
    identity_verified BOOLEAN,
    historical_tx_count INT
);


CREATE OR REPLACE TABLE transactions (
    tx_id STRING PRIMARY KEY,
    timestamp TIMESTAMP,
    user_id STRING,
    merchant_id STRING,
    amount_uzs NUMBER(18,2),
    channel STRING,
    hour_of_day INT,
    day_of_week INT,
    is_weekend BOOLEAN,
    session_duration_sec INT,
    login_attempts INT,
    is_cross_city_tx BOOLEAN,
    is_fraud BOOLEAN
);
select * from transactions;

--=============================FILE FORMAT================================
CREATE OR REPLACE FILE FORMAT FIN_CSV
TYPE = 'CSV'
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"';

--==========================STORAGE INTEGRATION===========================

CREATE OR REPLACE STORAGE INTEGRATION S3_FIN
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::411936688579:role/Snow_Role'
STORAGE_ALLOWED_LOCATIONS = ('s3://snowbukt10/Data/');

desc integration s3_FIN;

--=============================STAGE CREATION====================================
CREATE OR REPLACE STAGE FIN_STG
URL='s3://snowbukt10/Data/'
STORAGE_INTEGRATION = S3_FIN
FILE_FORMAT = FIN_CSV;

LIST @FIN_STG;

--=================================DATA INGESTION=================================
-- CREATE PIPE FINTECH_PIPE
-- AUTO_INGEST = TRUE
-- AS 
-- COPY INTO MERCHANTS
-- FROM @FIN_STG
-- FILE_FORMAT = FIN_CSV
-- ON_ERROR = 'SKIP_FILE';

-- drop pipe fintech_pipe;
-- ALTER PIPE FINTECH_PIPE REFRESH;

COPY INTO MERCHANTS
FROM @FIN_STG
FILE_FORMAT = FIN_CSV
ON_ERROR = 'SKIP_FILE';

select * from MERCHANTS;
------------------------------------------------------------

COPY INTO users
FROM @FIN_STG
FILE_FORMAT = FIN_CSV
ON_ERROR = 'SKIP_FILE';

select * from users;
--------------------------------------------------------------

COPY INTO transactions
FROM @FIN_STG
FILE_FORMAT = FIN_CSV
ON_ERROR = 'SKIP_FILE';

select * from transactions;
-------------------------------------------------------------

