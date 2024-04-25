select * from pizza_sales ;


--total revenue 
select SUM(total_price) as total_revenue from pizza_sales;

--average order value
select SUM(total_price)/COUNT(distinct order_id) as average_order_value from pizza_sales;

--total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales;

--total orders placed
select count(distinct order_id) as total_orders from pizza_sales;

--average pizza sold per order
select  cast(cast(sum(quantity) as decimal (10,2))/
cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2)) as average_pizza_sold from pizza_sales;


--sales by day
select DATENAME(DW,order_date) as day,count(distinct order_id) as total_orders  from pizza_sales
group by DATENAME(DW,order_date);

--sales by month
select datename(MONTH,order_date) as month,count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(MONTH,order_date) order by total_orders desc;



--percentage of pizza category sold

select pizza_category,sum (total_price) as total_Sales,(sum (total_price) / (select sum(total_price) from pizza_sales)) *100 as percentage_pizza_sold 
from pizza_sales
group by pizza_category;

--percentage of pizza sizes sold


select pizza_size,sum (total_price) as total_Sales,(sum (total_price) / (select sum(total_price) from pizza_sales)) *100 as percentage_pizza_sold 
from pizza_sales
group by pizza_size;


--5 best seller pizzas
select top 5 pizza_name,sum(quantity)as total_sold from pizza_sales
group by pizza_name
order by sum(total_price) desc;

--5 worst seller pizzas
select top 5 pizza_name,sum(quantity)as total_sold from pizza_sales
group by pizza_name
order by sum(total_price) asc;