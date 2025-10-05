# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Snowflake data sharing project that demonstrates how to create and manage secure data shares between Snowflake accounts. The repository contains a producer-side implementation that creates shares, grants permissions, and manages reader accounts.

## Architecture

The codebase follows a sequential execution pattern with numbered SQL scripts:

1. **01_create_database_objects.sql** - Foundation setup creating the SHARE_WH warehouse, SALES_DATA database, and sample CUSTOMER_ORDERS table with initial data
2. **02_create_shares.sql** - Creates the SALES_SHARE and grants necessary permissions (database usage, schema usage, table select) to share objects with consumer accounts
3. **03_show_grants.sql** - Diagnostic queries to inspect grants on shares, roles, users, and databases
4. **04_share_reader_account.sql** - Creates managed reader accounts and adds them to the share
5. **05_unshare_cleanup.sql** - Complete teardown process: removes accounts from shares, revokes grants, drops shares and reader accounts
6. **06_monitor_share_usage.sql** - Monitoring queries using ACCOUNT_USAGE schema to track data transfer and warehouse metering

## Execution Context

All scripts assume execution in a Snowflake SQL worksheet or SnowSQL CLI. Scripts must be run in numerical order for initial setup (01 → 02 → 04), as each depends on objects created in previous scripts.

The warehouse SHARE_WH is used for share management operations, while COMPUTE_WH is used for diagnostic queries in 03_show_grants.sql.

## Key Snowflake Concepts

- **Shares** are named objects that encapsulate granted privileges to database objects
- **Reader accounts** are managed Snowflake accounts created by the provider for consumers without their own Snowflake account
- Shares require grants at three levels: database USAGE, schema USAGE, and table SELECT
- The format for adding accounts to shares is: `ALTER SHARE <name> ADD ACCOUNTS = <org>.<account>`

## Monitoring

Share monitoring relies on SNOWFLAKE.ACCOUNT_USAGE views:
- DATA_TRANSFER_HISTORY tracks data transfer to share consumers
- WAREHOUSE_METERING_HISTORY monitors compute costs for reader accounts
