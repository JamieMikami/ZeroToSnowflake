--SETUP SECURE VIEWS TO SHARE
--see datasharing/dimensional_secure/__install_dimensional_secure.sql

-- CREATE SHARE
USE ROLE ACCOUNTADMIN;
CREATE OR REPLACE SHARE Z2S_SHARE;

--GRANT PRIVILEGES TO SHARE
USE DATABASE PC_FIVETRAN_DB;
USE SCHEMA SALESFORCE_Z2S;
GRANT USAGE     ON DATABASE             PC_FIVETRAN_DB          TO SHARE Z2S_SHARE;
GRANT USAGE     ON SCHEMA               SALESFORCE_Z2S          TO SHARE Z2S_SHARE;
GRANT SELECT    ON VIEW                 DIM_ACCOUNT_SECURE      TO SHARE Z2S_SHARE;
GRANT SELECT    ON VIEW                 DIM_OPPORTUNITY_SECURE  TO SHARE Z2S_SHARE;
GRANT SELECT    ON VIEW                 DIM_OWNER_SECURE        TO SHARE Z2S_SHARE;
GRANT SELECT    ON VIEW                 FACT_OPPORTUNITY_SECURE TO SHARE Z2S_SHARE;

SHOW GRANTS TO SHARE Z2S_SHARE;

--ALTER SHARE TO ADD A CONSUMER ACCOUNT
ALTER SHARE Z2S_SHARE ADD ACCOUNTS = DDLEARN;
--ALTER SHARE TIMETRAVEL_SHARE ADD ACCOUNTS = consumer_account1, consumer_account2;