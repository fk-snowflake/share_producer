# Snowflake Data Sharing - Producer Setup

This repository demonstrates how to set up and manage Snowflake data shares as a data provider. It includes complete workflows for creating shares, managing consumer access, and monitoring usage.

## Prerequisites

- Active Snowflake account with ACCOUNTADMIN privileges
- SnowSQL CLI or Snowflake web interface access
- Understanding of Snowflake account identifiers (organization.account format)

## Quick Start

Execute the SQL scripts in numerical order:

```sql
-- 1. Create warehouse, database, and sample data
@01_create_database_objects.sql

-- 2. Create share and grant permissions
@02_create_shares.sql

-- 3. (Optional) Verify grants
@03_show_grants.sql

-- 4. Create and add reader account to share
@04_share_reader_account.sql

-- 5. Monitor share usage and costs
@06_monitor_share_usage.sql
```

## What Gets Created

- **Warehouse**: `SHARE_WH` (XSMALL, auto-suspend 300s)
- **Database**: `SALES_DATA` with schema `PUBLIC`
- **Table**: `CUSTOMER_ORDERS` with sample order data
- **Share**: `SALES_SHARE` granting SELECT access to CUSTOMER_ORDERS
- **Reader Account**: `READER_ANALYTICS` (managed account for consumers)

## Script Overview

| Script | Purpose |
|--------|---------|
| `01_create_database_objects.sql` | Initialize warehouse, database, schema, and sample data |
| `02_create_shares.sql` | Create share and grant object permissions |
| `03_show_grants.sql` | Diagnostic queries to inspect permissions |
| `04_share_reader_account.sql` | Create managed reader account for data consumers |
| `05_unshare_cleanup.sql` | Complete teardown of shares and accounts |
| `06_monitor_share_usage.sql` | Monitor data transfer and compute costs |

## Customization

Before running, update the following:

- **Account identifiers** in `02_create_shares.sql` (line 11) and `04_share_reader_account.sql` (line 10)
- **Admin credentials** in `04_share_reader_account.sql` (lines 3-4)
- **Sample data** in `01_create_database_objects.sql` to match your use case

## Monitoring

Use `06_monitor_share_usage.sql` to track:
- Outbound shares and their configurations
- Data transfer to consumer accounts
- Warehouse costs for reader accounts

## Cleanup

To remove all created objects, run `05_unshare_cleanup.sql`. This will:
1. Remove consumer accounts from the share
2. Revoke all granted permissions
3. Drop the share and reader accounts

## Security Notes

- Change default passwords in production environments
- Review and restrict warehouse permissions as needed
- Monitor ACCOUNT_USAGE regularly for unauthorized access
- Use secure shares for cross-region/cross-cloud sharing when required
