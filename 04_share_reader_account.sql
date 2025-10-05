-- Create managed reader account
CREATE MANAGED ACCOUNT READER_ANALYTICS
    ADMIN_NAME = 'reader_admin'
    ADMIN_PASSWORD = 'SecurePass123!'
    TYPE = READER;

-- Add reader account to share
ALTER SHARE SALES_SHARE ADD ACCOUNTS = zlmnhtd.READER_ANALYTICS;