create database hr_attririon_project;
use hr_attririon_project;
rename table `hr att` to hr_data;
select
count(*) from hr_data;
select
attrition,
count(*) as employee_count,
round(count(*)*100.0/(select count(*) from hr_data),1) as percentage
from hr_data
group by attrition;
-- attrition by department
select 
department,
count(*) as total_employees,
sum(case when attrition ="yes" then 1 else 0 end) as attririon_count,
round(sum(case when attrition ="yes" then 1 else 0 end)*100/count(*),1) as attrition_rate
from hr_data
group by department
order by attrition_rate desc;
-- attririon by job role
select
jobrole,
count(*) as total_employees,
sum(case when attrition="yes" then 1 else 0 end) as attririon_count,
round(sum(case when attrition="yes" then 1 else 0 end)*100/count(*),1) as attrition_rate
from hr_data
group by jobrole
order by attrition_rate desc;
-- ranking department based on attrition
select
department,round(sum(case when attrition="yes" then 1 else 0 end)*100/count(*),2) as attrition_rate,
rank()over (order by sum(case when attrition="yes" then 1 else 0 end)*100/count(*) desc) as attririon_rank
from hr_data
group by department;
-- employees monthly income over jobe roles average
select
employeenumber,jobrole,monthlyincome,
round(avg(monthlyincome) over (partition by jobrole),2) as avg_income_by_role
from hr_data;
-- attrition risk tier per employee
create view risk_tier as 
SELECT 
    EmployeeNumber,
    JobRole,
    OverTime,
    JobSatisfaction,
    YearsAtCompany,
    CASE 
        WHEN OverTime = 'Yes' AND JobSatisfaction <= 2 THEN 'High Risk'
        WHEN OverTime = 'Yes' OR JobSatisfaction <= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS attrition_risk_tier
FROM hr_data;
select * from risk_tier
order by attrition_risk_tier desc
limit 20


