create database zomato_db;
alter table `zomato vs swiggy` rename to zs_data;
select
count(*) from zs_data;
select
city,avg(swiggy_estimated_monthly_revenue_inr),avg(zomato_estimated_monthly_revenue_inr)
from zs_data
group by city;
select
city,restaurant_name,swiggy_estimated_monthly_revenue_inr,zomato_estimated_monthly_revenue_inr,
rank() over(partition by city
order by (swiggy_estimated_monthly_revenue_inr+zomato_estimated_monthly_revenue_inr)desc
)
as rank_city
from zs_data
order by city,rank_city;
select
city,restaurant_name,swiggy_estimated_monthly_revenue_inr+zomato_estimated_monthly_revenue_inr as total_revenue,
avg(swiggy_estimated_monthly_revenue_inr+zomato_estimated_monthly_revenue_inr)over(
partition by city) as city_avg_revenue
from zs_data;
select
restaurant_name,city,avg_cost_per_person_inr,
case
when avg_cost_per_person_inr<300 then 'budget'
when avg_cost_per_person_inr between 300 and 700 then 'budget'
else 'premium'
end as price_tier
from zs_data;
