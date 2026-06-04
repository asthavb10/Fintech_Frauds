**# End-to-End Fintech Fraud Analytics using Snowflake, dbt and Power BI**

This project implements a modern data analytics pipeline for fraud detection and risk analysis in a fintech environment.
The solution ingests transaction, user, and merchant data from AWS S3 into Snowflake, transforms it using dbt, tracks historical user changes through SCD Type 2 snapshots, and delivers business-ready analytics marts for Power BI reporting.
--------------------------------------------------------------------------------------------
## Tech Stack
- AWS S3
- Snowflake
- dbt
- SQL
- Power BI
- GitHub
---------------------------------------------------------------------------------------------
## Data Flow
AWS S3
→ Snowflake Storage Integration
→ External Stage
→ Raw Layer
→ Silver Layer
→ SCD Type 2 Snapshot
→ Intermediate Layer
→ Gold Layer
→ Power BI
----------------------------------------------------------------------------------------
## Data Warehouse Layers
### Raw Layer
- Users
- Merchants
- Transactions

### Silver Layer
- Data cleaning
- Standardization
- Null handling

### Snapshot Layer
- User history tracking
- SCD Type 2 implementation

### Intermediate Layer
- User fraud analysis
- Merchant risk analysis
- User behavior analysis

### Gold Layer
- Dimensions
- Fact tables
- Reporting marts
-----------------------------------------------------------------------------------------
## Star Schema
Dimensions:
- Dim_Users
- Dim_Merchants
- Dim_User_History

Facts:
- Fact_Transactions
- Fact_Fraud

Marts:
- Mart_User_Risk
- Mart_Merchant_Risk
- Mart_Fraud_Summary

---------------------------------------------------------------------------------------
## Key Insights
- Fraud transactions represented X% of total transactions.
- Online merchants showed higher fraud exposure than offline merchants.
- Users with lower credit scores exhibited higher fraud rates.
- Cross-city transactions were significantly associated with fraudulent activity.
----------------------------------------------------------------------------------------
## Skills Demonstrated
- Data Warehousing
- Snowflake
- dbt
- Dimensional Modeling
- SCD Type 2
- SQL
- Data Quality Testing
- Data Transformation
- Power BI
- Data Visualization
