/* ============================================================
   HYPOTHESIS 2:
   Fluctuations in Average Order Value (AOV) are causing
   Revenue Fluctuations

   Objective:
   To analyze whether changes in customer spending per order
   are contributing to revenue inconsistency.

_______________________________________________
*/

-- STEP 1 : CALCULATE THE AVERAGE ORDER VALUE 

SELECT
    ROUND(SUM(revenue) / COUNT(order_id),2) AS average_order_value
FROM orders;

-- Step 2 : total revenue 

select sum(revenue)as total_revenue
from orders;

--  total orders 

select count(order_id)as total_orders
from orders;

-- yearly comparisons for AVG order value  

select 
year(order_timestamp)as year,
ROUND(SUM(revenue) / COUNT(order_id),2) AS average_order_value
from orders
group by year(order_timestamp)
order by average_order_value;


-- MONTHLY WISE AOV trend in 2024


SELECT 
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    SUM(revenue) AS total_revenue,
    ROUND(SUM(REVENUE)/COUNT(ORDER_ID),2)as avg_order_value
FROM orders
WHERE YEAR(order_timestamp) = 2024
GROUP BY 
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)
ORDER BY 
    month_no;

-- MONTHLY WISE AOV trend in 2025


SELECT 
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    SUM(revenue) AS total_revenue,
    ROUND(SUM(REVENUE)/COUNT(ORDER_ID),2)as avg_order_value
FROM orders
WHERE YEAR(order_timestamp) = 2025
GROUP BY 
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)
ORDER BY 
    month_no;
    
    
-- MONTHLY WISE AOV trend in 2026


SELECT 
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    SUM(revenue) AS total_revenue,
    ROUND(SUM(REVENUE)/COUNT(ORDER_ID),2)as avg_order_value
FROM orders
WHERE YEAR(order_timestamp) = 2026
GROUP BY 
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)
ORDER BY 
    month_no;


-- NOW COMPAISIONS BETWEEN 2024 , 2025 

-- Revenue and AOV Comparison with Difference (2024 vs 2025)

SELECT
    ROUND(SUM(CASE WHEN YEAR(order_timestamp) = 2024 THEN revenue END), 2) AS revenue_2024,
    ROUND(SUM(CASE WHEN YEAR(order_timestamp) = 2025 THEN revenue END), 2) AS revenue_2025,
    ROUND(
        SUM(CASE WHEN YEAR(order_timestamp) = 2025 THEN revenue END) -
        SUM(CASE WHEN YEAR(order_timestamp) = 2024 THEN revenue END), 2
    ) AS revenue_difference,

    ROUND(AVG(CASE WHEN YEAR(order_timestamp) = 2024 THEN revenue END), 2) AS aov_2024,
    ROUND(AVG(CASE WHEN YEAR(order_timestamp) = 2025 THEN revenue END), 2) AS aov_2025,
    ROUND(
        AVG(CASE WHEN YEAR(order_timestamp) = 2025 THEN revenue END) -
        AVG(CASE WHEN YEAR(order_timestamp) = 2024 THEN revenue END), 2
    ) AS aov_difference
FROM orders;

-- CHECKING FOR JAN , FEB , MAR , APR

SELECT
    YEAR(order_timestamp) AS year,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM orders
WHERE YEAR(order_timestamp) IN (2024, 2025, 2026)
  AND MONTH(order_timestamp) BETWEEN 1 AND 4
GROUP BY YEAR(order_timestamp)
ORDER BY year;
