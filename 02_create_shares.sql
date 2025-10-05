USE WAREHOUSE SHARE_WH;

create share SALES_SHARE;

grant usage on database sales_data to share sales_share;

grant usage on schema sales_data.public to share sales_share;

grant select on table sales_data.public.customer_orders to share sales_share;

alter share sales_share add accounts = zlmnhtd.fits;

show grants  to share sales_share;

desc share sales_share;

