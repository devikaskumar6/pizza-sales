create database pizza;
use pizza;
select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales;
select sum(quantity) as Total_pizza_sold from pizza_sales;
select count(distinct order_id) as Total_orders from pizza_sales;
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales;

SELECT DATE_ADD(order_date, INTERVAL 7 DAY) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATE_ADD(order_date, INTERVAL 7 DAY);



SELECT 
    DATE_FORMAT(STR_TO_DATE(order_date, '%d/%m/%Y'), '%Y-%m') AS Month,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
GROUP BY 
    Month
ORDER BY 
    Month;
    
    
    SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
 AS DECIMAL(10,2)) AS PCT
 FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;



SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;



SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Revenue DESC
LIMIT 5;

SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Revenue ASC
LIMIT 5;


SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Pizza_Sold
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Pizza_Sold DESC
LIMIT 5;

SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Pizza_Sold
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Pizza_Sold ASC
LIMIT 5;


SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Orders DESC
LIMIT 5;

SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Orders ASC
LIMIT 5;

SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM 
    pizza_sales
WHERE 
    pizza_category = 'Classic'
GROUP BY 
    pizza_name
ORDER BY 
    Total_Orders DESC
LIMIT 5;
