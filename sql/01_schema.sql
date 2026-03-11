drop database automated_sales_bi;
CREATE DATABASE automated_sales_bi;
USE automated_sales_bi;
show  tables;
drop table orders_table;
select *from superstore limit 10 ;
alter table superstore change column sub_category sub_category varchar(50);
ALTER TABLE superstore RENAME COLUMN `sub-category` TO `sub_category`;
SELECT sales
FROM superstore
WHERE sales NOT REGEXP '^[0-9.]+$';
select ship_mode
FROM superstore
WHERE ship_mode NOT REGEXP '^[0-9.]+$';


CREATE TABLE superstore_clean AS
SELECT
    row_id,
    order_id,

    STR_TO_DATE(order_date,'%Y-%m-%d') AS order_date,
    STR_TO_DATE(ship_date,'%Y-%m-%d') AS ship_date,

    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,

    CAST(NULLIF(TRIM(sales), '') AS DECIMAL(10,4)) AS sales,

    CAST(NULLIF(TRIM(quantity), '') AS SIGNED) AS quantity,

    CAST(NULLIF(TRIM(discount), '') AS DECIMAL(10,4)) AS discount,

    CAST(NULLIF(TRIM(profit), '') AS DECIMAL(10,4)) AS profit

FROM superstore;




