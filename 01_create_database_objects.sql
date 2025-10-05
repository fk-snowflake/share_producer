-- Create a dedicated warehouse for data sharing operations
-- XSMALL size is cost-effective for share management tasks
-- Auto-suspend after 5 minutes (300 seconds) to minimize costs
-- Auto-resume ensures seamless query execution when needed
CREATE WAREHOUSE SHARE_WH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 300
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

-- Set the active warehouse for subsequent commands
USE WAREHOUSE SHARE_WH;

-- Create the main database to hold data that will be shared
CREATE DATABASE SALES_DATA;

-- Create the PUBLIC schema within SALES_DATA database
CREATE SCHEMA SALES_DATA.PUBLIC;

-- Create a table to store customer order information
-- This table will be shared with consumer accounts
CREATE TABLE SALES_DATA.PUBLIC.CUSTOMER_ORDERS (
    ORDER_ID NUMBER,
    CUSTOMER_ID NUMBER,
    ORDER_DATE DATE,
    AMOUNT DECIMAL(10,2),
    REGION VARCHAR(50)
);

-- Populate the table with sample order data for demonstration
-- Represents orders from different regions with varying amounts
INSERT INTO SALES_DATA.PUBLIC.CUSTOMER_ORDERS VALUES
    (1, 101, '2024-01-15', 5000.00, 'NORTH'),
    (2, 102, '2024-01-16', 7500.00, 'SOUTH'),
    (3, 103, '2024-01-17', 3200.00, 'EAST');


