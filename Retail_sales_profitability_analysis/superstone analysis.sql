create database retail_analysis;
use retail_analysis;
select count(*) as total_rows
from superstone_cleaned;
show columns from superstone_cleaned;
select
min(sales) as min_s,
max(sales) as max_s,
count(sales) as tot
from superstone_cleaned;
SELECT
    COUNT(*) AS total_records,
    COUNT(Sales) AS valid_sales,
    COUNT(*) - COUNT(Sales) AS null_sales,
    MIN(Sales) AS minimum_sales,
    MAX(Sales) AS maximum_sales
FROM superstone_cleaned;
select count(*) as total_records,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round(sum(profit)/nullif(sum(sales),0)*100,2) as profit_margin_percentage,
sum(quantity) as total_quantity_sold
from superstone_cleaned;
select
category,
count(*) as total_records,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round(sum(profit)/nullif(sum(sales),0)*100,2) as profit_margin_percentage,
sum(quantity) as total_quantity_sold
from superstone_cleaned
group by category
order by total_profit desc;
select
region,
count(*) as total_records,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round(sum(profit)/nullif(sum(sales),0)*100,2) as profit_margin_percentage,
sum(quantity) as total_quantity_sold
from superstone_cleaned
group by region
order by total_profit desc;
select
case
when discount=0 then 'no discount'
when discount<=0.2 then '1-20%'
when discount<=0.4 then '20-40%'
when discount<=0.6 then '40-60%'
else 'above 60%'
end as discount_range,
count(*) as total_records,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round(sum(profit)/nullif(sum(sales),0)*100,2) as profit_margin_percentage,
sum(quantity) as total_quantity_sold
from superstone_cleaned
group by discount_range
order by discount_range asc;
SELECT
    Category,
    `Sub-Category`,
   count(*) as total_records,
round(sum(sales),2) as total_sales,
round(sum(profit),2) as total_profit,
round(sum(profit)/nullif(sum(sales),0)*100,2) as profit_margin_percentage,
sum(quantity) as total_quantity_sold
from superstone_cleaned
GROUP BY Category,`Sub-Category`
ORDER BY total_profit ASC;
show columns from superstone_cleaned;
select `order date`,
str_to_date(`order date`,'%d-%m-%Y') as converted_date
from superstone_cleaned
limit 10;
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS profit_margin
FROM superstone_cleaned
GROUP BY
    order_year,
    order_month
ORDER BY
    order_year,
    order_month;

