USE WAREHOUSE FINTECH_WH;
use database Fintech;
use schema raw;

--=================================STREAMS======================================

CREATE OR REPLACE STREAM TRANSACTIONS_STREAM
ON TABLE RAW.TRANSACTIONS;

select * from TRANSACTIONS_STREAM;

--================================TASKS========================================

CREATE OR REPLACE TASK TRANSACT_TASK
WAREHOUSE = FINTECH_WH
SCHEDULE = '5 MINUTE'
AS
SELECT COUNT(*) FROM RAW.TRANSACTIONS_STREAM;


ALTER TASK TRANSACT_TASK resume;

--==============================TIME TRAVEL======================================

SELECT * FROM RAW.TRANSACTIONS
AT (OFFSET => -60*10);

--============================ZERO COPY CLONING=================================

CREATE TABLE RAW.TRANSACTIONS_BACKUP CLONE RAW.TRANSACTIONS;

--===========================SCD2========================================
CREATE SCHEMA IF NOT EXISTS FINTECH.SNAPSHOTS;

SELECT * FROM USERS_SNAPSHOT
where name ='Nodir yusupov';
SHOW TABLES IN DATABASE FINTECH;
SHOW SCHEMAS IN DATABASE FINTECH;
SHOW TABLES LIKE '%SNAPSHOTS';

--============================Gold Layer===================================


select * from FINTECH.GOLD.DIM_USERS;
select * from FINTECH.GOLD.DIM_MERCHANTS;
select * from FINTECH.GOLD.DIM_USER_HISTORY;

select * from FINTECH.GOLD.FACT_TRANSACTIONS;
select * from FINTECH.GOLD.FACT_FRAUDS;

select * from FINTECH.GOLD.MART_USERs;
select * from FINTECH.GOLD.MART_MERCHANT;
select * from FINTECH.GOLD.MART_FRAUD;

--============================SEARCH OPTIMIZATION====================================

ALTER TABLE GOLD.FACT_TRANSACTIONS
ADD SEARCH OPTIMIZATION;

