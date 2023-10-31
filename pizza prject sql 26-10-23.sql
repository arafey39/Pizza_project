select sum(total_price) as Total_revenue from pizza_sales

select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales

select * from pizza_sales

select sum(quantity) as total_pizzas_sold from pizza_sales

select count(distinct order_id) as total_orders_placed from pizza_sales

select cast(cast(sum(quantity) as decimal (10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizza_order
from pizza_sales

--hourly trend for pizzas sold

select DATEPART(hour, order_time) as order_hour, sum(quantity) as total_pizzas_sold
from pizza_sales
group by DATEPART(hour, order_time)
order by  DATEPART(hour, order_time)


--weekely trend for total orders
select DATEPART(ISO_WEEK, order_date) as order_weekely, year(order_date) as year, count(distinct order_id) as total_orders

from pizza_sales
group by DATEPART(ISO_WEEK, order_date),
year(order_date)
order by DATEPART(ISO_WEEK, order_date),
year(order_date) 

use Pizza_DB
select * from pizza_sales

--percentage of sales by pizza category and the where clause can be used to filter out the data by month
select pizza_category,sum(total_price) as sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as Percentage_sales 
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category

use Pizza_DB
select * from pizza_sales

select pizza_size,sum(total_price) as total_sales ,cast(sum(total_price) * 100 /(select sum(total_price)
from pizza_sales where DATEPART(quarter, order_date) = 1) as decimal (10,2)) as Sales_by_Size_percent
from pizza_sales
where DATEPART(quarter, order_date) = 1
group by pizza_size
order by Sales_by_Size_percent desc


select top 5 pizza_name_id, cast(sum(quantity) as decimal (10,2)) as total_quantity from pizza_sales
group by pizza_name_id
order by sum(quantity) 

select top 5 pizza_name_id, count(distinct order_id) as total_orders 
from pizza_sales 
group by pizza_name_id
order by total_orders 

