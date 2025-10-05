-- Set active warehouse for diagnostic queries
USE WAREHOUSE COMPUTE_WH;

-- Display all privileges granted in the current account
SHOW GRANTS;

-- Show what privileges have been granted TO the share (what the share can access)
SHOW GRANTS TO SHARE SALES_SHARE;

-- Show which accounts have access to the share (share consumers)
SHOW GRANTS OF SHARE SALES_SHARE;

-- Show privileges granted ON the share object itself
SHOW GRANTS ON SHARE SALES_SHARE;

-- Display privileges granted TO the ACCOUNTADMIN role
SHOW GRANTS TO ROLE ACCOUNTADMIN;

-- Display privileges that the ACCOUNTADMIN role has granted to others
SHOW GRANTS OF ROLE ACCOUNTADMIN;

-- Display all privileges granted to a specific user
-- Replace FERNANDOKARNAGI with your username for inspection
SHOW GRANTS TO USER FERNANDOKARNAGI;

-- Display all privileges granted on the SALES_DATA database
SHOW GRANTS ON DATABASE SALES_DATA;