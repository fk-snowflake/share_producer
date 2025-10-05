-- Set the active warehouse for share creation and management
USE WAREHOUSE SHARE_WH;

-- Create a new share object named SALES_SHARE
-- A share is a container that holds references to database objects
CREATE SHARE SALES_SHARE;

-- Grant USAGE privilege on the database to the share
-- This allows consumers to see the database exists
GRANT USAGE ON DATABASE SALES_DATA TO SHARE SALES_SHARE;

-- Grant USAGE privilege on the schema to the share
-- This allows consumers to see the schema and its objects
GRANT USAGE ON SCHEMA SALES_DATA.PUBLIC TO SHARE SALES_SHARE;

-- Grant SELECT privilege on the table to the share
-- This allows consumers to query data from CUSTOMER_ORDERS table
GRANT SELECT ON TABLE SALES_DATA.PUBLIC.CUSTOMER_ORDERS TO SHARE SALES_SHARE;

-- Add a consumer account to the share using organization.account format
-- Replace ZLMNHTD.FITS with your actual consumer account identifier
ALTER SHARE SALES_SHARE ADD ACCOUNTS = ZLMNHTD.FITS;

