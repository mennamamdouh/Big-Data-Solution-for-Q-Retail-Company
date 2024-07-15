CREATE DATABASE IF NOT EXISTS qcompany
LOCATION '/user/itversity/q-retail-company/gold';

use database qcompany;

CREATE EXTERNAL TABLE branch_dim(
    branch_key INT,
    branch_id INT,
    branch_location STRING,
    branch_establish_date DATE,
    branch_class CHAR(1)    
)
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/branch_dim';


CREATE EXTERNAL TABLE agent_dim(
    agent_key INT,
    agent_id INT,
    agent_name STRING,
    agent_hire_date DATE )
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/agent_dim';

CREATE EXTERNAL TABLE customer_dim(
    customer_key INT,
    customer_fname STRING,
    customer_lname STRING,
    customer_email STRING
)
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/customer_dim';

CREATE EXTERNAL TABLE product_dim(
    product_key INT,
    product_name STRING,
    product_price DOUBLE,
    product_category STRING
)
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/product_dim';


CREATE EXTERNAL TABLE offline_transaction_fact (
    offline_transaction_key INT,
    offline_transaction_id STRING,
    transaction_date DATE,
    customer_key INT,
    product_key INT,
    unit_price DOUBLE,
    quantity INT,
    total_price DOUBLE,
    offer_redeemed STRING,
    discount_pct DOUBLE,
    final_price DOUBLE,
    payment_method STRING,
    branch_key INT,
    agent_key INT
)
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/offline_transaction_fact';


CREATE EXTERNAL TABLE online_transaction_fact (
    online_transaction_key INT,
    online_transaction_id STRING,
    transaction_date DATE,
    customer_key INT,
    product_key INT,
    unit_price DOUBLE,
    quantity INT,
    total_price DOUBLE,
    offer_redeemed STRING,
    discount_pct DOUBLE,
    final_price DOUBLE,
    payment_method STRING,
    shipping_address STRING,
    shipping_city STRING,
    shipping_state STRING,
    shipping_postal_code STRING
)
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/online_transaction_fact';

CREATE EXTERNAL TABLE date_dim (
    `date` DATE,
    day_of_week STRING,
    day INT,
    month INT,   
    year INT,
    quarter STRING,
    is_holiday STRING,
    is_weekend STRING
)
STORED AS PARQUET
LOCATION '/user/itversity/q-retail-company/gold/qcompany.db/date_dim';