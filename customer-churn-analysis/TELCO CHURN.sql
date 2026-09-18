create database telco_db;
select *
from telco_db;
select count(*) as total_customers
from `churn project`;
rename table `churn project` to churn;
describe churn;
select count(*) as total_customers,
sum(CASE WHEN Churn='Yes' THEN 1 ELSE 0
END) AS CHURNED_CUSTOMERS,
round(sum(CASE WHEN Churn='Yes' THEN 1 ELSE 0
END)*100.0/count(*),2)as churn_rate_percentage
from churn;
select
customerid,tenure,monthlycharges,totalcharges
from churn 
where TotalCharges=' ' or TotalCharges='' or TotalCharges is null;
select churn,
count(customerid) as total_customers,
round(sum(monthlycharges),2) as total_monthly_revenue,
round(avg(monthlycharges),2) as avg_monthly_revenue,
round(sum(totalcharges),2) as cumulative_revenue
from churn
group by churn;
rename table churn to telco_customers;
select
internetservice,techsupport,onlinesecurity,
count(customerid) as total_customers,
sum(case when churn='yes' then 1 else 0 end) as churned_count
from telco_customers
group by internetservice,techsupport,onlinesecurity
order by churned_count desc;
select Contract,PaymentMethod,
count(customerid) as total_customers,
sum(case when churn ='Yes' then 1 else 0 end) as churned_cu
from telco_customers
group by Contract,PaymentMethod
order by churned_cu desc;
create or replace view churn_risk_segment as
select
customerID,tenure,Contract,TechSupport,PaymentMethod,MonthlyCharges,TotalCharges,churn,
case 
when tenure<=12 then '0-1 year'
when tenure<=24 then '1-2 year'
when tenure<= 48 then '2-4 year'
else '4+ year'
end as tenure_bracket,
case
when Contract='month-to-month' and tenure<=12 and TechSupport='no' then 'critical risk'
when contract='month-to-month' then 'high risk'
when contract='one year' then 'moderate risk'
else 'low risk'
end as churn_risk_tier
from telco_customers;
select
churn_risk_tier,
count(*) as total_customers,
sum(case when churn ='Yes' then 1 else 0 end) as churned_COUNT
FROM churn_risk_segment
group by churn_risk_tier
order by churned_COUNT DESC




