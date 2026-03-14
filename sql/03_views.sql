use automated_sales_bi;
#Create KPI View
CREATE VIEW vw_sales_kpi AS
SELECT 
    round(SUM(sales),2) AS total_sales,
    round(SUM(profit),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id),2) AS avg_order_value
FROM superstore_clean;

#Create Region Performance View
CREATE VIEW vw_region_performance AS
SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY region;

#Create Category Performance View
CREATE VIEW vw_category_performance AS
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY category;

#Create Monthly Trend View
CREATE OR REPLACE VIEW vw_monthly_sales_trend AS
SELECT 
    MONTH(order_date) AS month_number,
    MONTHNAME(order_date) AS order_month,
    SUM(sales) AS monthly_sales,
    SUM(profit) AS monthly_profit
FROM superstore_clean
GROUP BY month_number, order_month
ORDER BY month_number;

#Create Top Products View
CREATE VIEW vw_top_products AS
SELECT 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY product_name
ORDER BY total_profit DESC;

#Check your views
SHOW FULL TABLES 
WHERE TABLE_TYPE = 'VIEW';

SELECT * 
FROM vw_sales_kpi;