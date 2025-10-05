-- Create a managed reader account for consumers without their own Snowflake account
-- Reader accounts are fully managed by the provider and billed to the provider
-- TYPE = READER restricts the account to read-only operations on shared data
CREATE MANAGED ACCOUNT READER_ANALYTICS
    ADMIN_NAME = 'reader_admin'
    ADMIN_PASSWORD = 'SecurePass123!'
    TYPE = READER;

-- List all accounts in the organization to verify the reader account was created
-- Shows account names, locators, regions, and account types
SHOW ACCOUNTS;

-- Add the newly created reader account to the existing share
-- Uses organization.account format (lowercase) to reference the reader account
ALTER SHARE SALES_SHARE ADD ACCOUNTS = zlmnhtd.READER_ANALYTICS;