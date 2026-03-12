use automated_sales_bi;
#check table structure 
describe superstore_clean;
#preview the table 
select * from superstore_clean;
#Count total rows 
select count(*) from superstore_clean;

#Calculate total sales and total profit 
select round(sum(sales),2) as total_sales , round(sum(profit),2) as total_profit from superstore_clean;
#Count total unique order
select count(distinct order_id) as total_order from superstore_clean;
#Calculate average order value 
select round(sum(sales)/ count(distinct order_id) ,2) as avg_order_value from superstore_clean;
#Analyze region by sales and profit 
select region , round(sum(sales),2) as total_sales, round(sum(profit),2)as total_profit from superstore_clean group by region order by total_sales desc;
#Analyze category wise performance 
select category ,round(sum(sales),2) as total_sales , round(sum(profit),2) as total_profit from superstore_clean group by category order by total_profit desc;
#Analyze sub-category performance
select sub_category, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit 
from superstore_clean group by sub_category order by total_profit desc;
#Analyze customer segment performance
select segment, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit
from superstore_clean group by segment order by total_sales desc;
#Analyze monthly sales and profit trend
select order_month ,round(sum(sales),2) as total_sales , round(sum(profit),2) as total_profit
from superstore_clean group by order_month order by order_month desc;
#Find top 10 profitable products
select product_name , round(sum(sales),2) as total_sales , round(sum(profit),2) as total_profit
from superstore_clean group by product_name order by total_profit desc limit 10;
#Find top 10 loss-making products
select product_name, round(sum(sales),2) as total_sales , round(sum(profit),2) as total_profit
from superstore_clean group by product_name order by total_profit asc limit 10;
#Analyze discount impact on profit
select discount_bucket, round(sum(sales),2)as total_slaes , round(sum(profit),2) as total_profit
from superstore_clean group by discount_bucket order by discount_bucket;
#Analyze shipping performance
select ship_mode, round(avg(ship_days),2) as avg_ship_days
from superstore_clean group by ship_mode order by avg_ship_days desc;
#Analyze top states by sales
select state ,round(sum(sales),2) as total_sales from superstore_clean group by state order by total_sales desc limit 10;
#Analyze profit margin by category
select category, round(avg(profit_margin),2) as avg_profit_margin from superstore_clean group by category order by avg_profit_margin desc; 

