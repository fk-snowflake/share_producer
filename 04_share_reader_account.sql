-- Create managed reader account
CREATE MANAGED ACCOUNT READER_ANALYTICS
    ADMIN_NAME = 'reader_admin'
    ADMIN_PASSWORD = 'SecurePass123!'
    TYPE = READER;

-- Add reader account to share
ALTER SHARE SALES_SHARE ADD ACCOUNTS = zlmnhtd.READER_ANALYTICS;

-- Note: Reader accounts don't have compute resources
-- Provider must create virtual warehouse for them
CREATE WAREHOUSE READER_WH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60;

-- Note: Reader account will specify READER_WH when querying shared data
-- Example: USE WAREHOUSE READER_WH; (executed in reader account session)