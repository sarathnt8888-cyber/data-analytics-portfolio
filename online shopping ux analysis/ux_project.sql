
create database if not exists ux_project;
use ux_project;
select count(*) as total_sessions,
sum(revenue) as purchased_sessions
from online_shoppers_clean;
SELECT
    COUNT(*) AS total_sessions,
    SUM(Revenue) AS purchase_sessions,
    ROUND(100.0 * SUM(Revenue) / COUNT(*), 2) AS conversion_rate_pct
FROM online_shoppers_clean;
SELECT
    VisitorType,
    COUNT(*) AS total_sessions,
    SUM(Revenue) AS purchase_sessions,
    ROUND(100.0 * SUM(Revenue) / COUNT(*), 2) AS conversion_rate_pct
FROM online_shoppers_clean
GROUP BY VisitorType
ORDER BY conversion_rate_pct DESC;
SELECT
    Revenue,
    COUNT(*) AS total_sessions,
    ROUND(AVG(ProductRelated), 2) AS avg_product_pages,
    ROUND(AVG(ProductRelated_Duration) / 60, 2) AS avg_product_minutes,
    ROUND(AVG(ExitRates) * 100, 2) AS avg_exit_rate_pct
FROM online_shoppers_clean
GROUP BY Revenue;
