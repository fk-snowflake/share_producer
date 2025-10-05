-- Display all shares created in this account (outbound shares)
-- Shows share name, kind, database name, and consumer accounts
SHOW SHARES;

-- Show detailed information about a specific share
-- Displays the objects included in the share and their privileges
DESC SHARE SALES_SHARE;

-- Query data transfer history to track how much data consumers are accessing
-- Filters for AWS cloud targets to monitor cross-account data transfer
-- Useful for understanding consumption patterns and costs
SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.DATA_TRANSFER_HISTORY
WHERE TARGET_CLOUD = 'aws';

-- Monitor compute costs for reader accounts by tracking warehouse usage
-- Shows credits consumed, execution time, and query counts
-- Replace 'READER_WH' with your reader account's warehouse name
SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.WAREHOUSE_METERING_HISTORY
WHERE WAREHOUSE_NAME = 'READER_WH';