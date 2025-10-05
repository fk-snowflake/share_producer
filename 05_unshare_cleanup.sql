-- Remove the consumer account from the share
-- This revokes their access to shared data
ALTER SHARE SALES_SHARE REMOVE ACCOUNTS = ZLMNHTD.FITS;

-- Revoke SELECT privilege on the table from the share
-- Must revoke in reverse order: table → schema → database
REVOKE SELECT ON TABLE SALES_DATA.PUBLIC.CUSTOMER_ORDERS FROM SHARE SALES_SHARE;

-- Revoke USAGE privilege on the schema from the share
REVOKE USAGE ON SCHEMA SALES_DATA.PUBLIC FROM SHARE SALES_SHARE;

-- Revoke USAGE privilege on the database from the share
REVOKE USAGE ON DATABASE SALES_DATA FROM SHARE SALES_SHARE;

-- Delete the share object completely
-- All consumer accounts must be removed and grants revoked first
DROP SHARE SALES_SHARE;

-- Delete the managed reader account if no longer needed
-- This permanently removes the account and all its resources
DROP MANAGED ACCOUNT READER_ANALYTICS;