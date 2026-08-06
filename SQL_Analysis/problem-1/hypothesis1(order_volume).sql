/*
Business Problem:
Revenue is inconsistent over time, showing fluctuations across different periods.

Hypothesis:
Decrease in order volume is causing revenue inconsistency.

Objective:
Analyze the relationship between order volume and revenue trends to determine whether changes in the number of orders are responsible for revenue fluctuations.
*/

-- Step 1 : Calculating overall KPI 

-- What is the total revenue 

select sum(revenue) as total_revenue
from orders;

-- What is the count of total orders

select count(order_id)as total_orders
from orders;

-- YEARLY COMPARISONS OF BOTH ORDERS AND REVENUE  

SELECT 
    YEAR(order_timestamp) AS order_year,
    SUM(revenue) AS revenue_generated
FROM orders
GROUP BY YEAR(order_timestamp)
ORDER BY revenue_generated DESC;

-- CHECKING ORDERS YEARLY 

SELECT year(order_timestamp)as year_of , COUNT(ORDER_ID)AS total_orders
from orders
group by year(order_timestamp)
order by total_orders;


-- NOW PERFORMING MONTHLY TREND

SELECT DISTINCT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name
FROM orders
WHERE YEAR(order_timestamp) = 2024
ORDER BY month_no;

-- for year 2025 

SELECT DISTINCT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name
FROM orders
WHERE YEAR(order_timestamp) = 2025
ORDER BY month_no;

-- for year 2026 

SELECT DISTINCT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name
FROM orders
WHERE YEAR(order_timestamp) = 2026
ORDER BY month_no;

/* from the above analysis we have understood there is only four months : JAN , FEB , MAR ,APR in 2026
so the only four months will be taken into consideration for the purpose of analysis 
*/

-- checking revenue and order monthly for the year 2024

SELECT 
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders
WHERE YEAR(order_timestamp) = 2024
GROUP BY 
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)
ORDER BY 
    month_no;

-- ANALYSING FOR THE YEAR 2025 

SELECT 
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders
WHERE YEAR(order_timestamp) = 2025
GROUP BY 
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)
ORDER BY 
    month_no;
    
-- ANALYSING FOR THE YEAR 2026 

select 
MONTH(order_timestamp)as month_no,
MONTHNAME(order_timestamp)as month_name,
count(order_id)as total_orders,
sum(revenue)as revenue_of_2026
from orders
where year(order_timestamp)=2026
group by MONTH(order_timestamp),MONTHNAME(order_timestamp)
order by MONTH(order_timestamp);

-- Since 2026 has only 4 months inorder to findout the inconsistencies we should move forward with four months only for each year 

SELECT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,

    -- Orders
    SUM(CASE WHEN YEAR(order_timestamp) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
    SUM(CASE WHEN YEAR(order_timestamp) = 2025 THEN 1 ELSE 0 END) AS orders_2025,
    SUM(CASE WHEN YEAR(order_timestamp) = 2026 THEN 1 ELSE 0 END) AS orders_2026,

    -- Revenue
    SUM(CASE WHEN YEAR(order_timestamp) = 2024 THEN revenue ELSE 0 END) AS revenue_2024,
    SUM(CASE WHEN YEAR(order_timestamp) = 2025 THEN revenue ELSE 0 END) AS revenue_2025,
    SUM(CASE WHEN YEAR(order_timestamp) = 2026 THEN revenue ELSE 0 END) AS revenue_2026

FROM orders

WHERE MONTH(order_timestamp) <= 4

GROUP BY
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)

ORDER BY month_no;

-- ROOT CAUSE ANALYSIS -- 

-- city with the revenue from year 2024 to 2025 (jan-april) months


-- REVENUE 

SELECT
    r.city,

    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END) AS revenue_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) AS revenue_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) AS revenue_2026

FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id

WHERE MONTH(o.order_timestamp) <= 4

GROUP BY r.city

ORDER BY r.city;


-- ORDERS FOR EACH CITY 

SELECT
    r.city,

    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END) AS orders_in_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) AS orders_in_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) AS orders_in_2026

FROM orders o
JOIN restaurants r
ON r.restaurant_id = o.restaurant_id

WHERE MONTH(o.order_timestamp) <= 4

GROUP BY r.city

ORDER BY r.city;


-- both 

SELECT
    r.city,

    -- Orders
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) AS orders_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) AS orders_2026,

    -- Revenue
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END) AS revenue_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) AS revenue_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) AS revenue_2026

FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id

WHERE MONTH(o.order_timestamp) <= 4

GROUP BY r.city

ORDER BY r.city;
  
-- to find out low performimng cities

SELECT
    r.city,

    -- Orders
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) AS orders_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) AS orders_2026,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END),
        1
    ) AS orders_24_to_25_pct,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END),
        1
    ) AS orders_25_to_26_pct,

    -- Revenue
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END) AS revenue_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) AS revenue_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) AS revenue_2026,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END),
        1
    ) AS revenue_24_to_25_pct,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END),
        1
    ) AS revenue_25_to_26_pct

FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id

WHERE MONTH(o.order_timestamp) <= 4

GROUP BY r.city

ORDER BY r.city;

-- RESTAURANT ANALYSIS FOR DELHI AND MUMBAI (PRIORITY CITIES ) 

-- counting totaal no of restaurants in Delhi and Mumbai 

SELECT
    city,
    COUNT(restaurant_id) AS no_of_restaurants
FROM restaurants
WHERE city IN ('Mumbai', 'Delhi')
GROUP BY city
ORDER BY no_of_restaurants DESC;

-- Delhi restaurant analysis 

SELECT
    r.restaurant_name,

    -- Orders
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) AS orders_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) AS orders_2026,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END),
        1
    ) AS orders_24_to_25_pct,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END),
        1
    ) AS orders_25_to_26_pct,

    -- Revenue
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END) AS revenue_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) AS revenue_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) AS revenue_2026,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END),
        1
    ) AS revenue_24_to_25_pct,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END),
        1
    ) AS revenue_25_to_26_pct

FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id

WHERE r.city = 'Delhi'
  AND MONTH(o.order_timestamp) <= 4

GROUP BY r.restaurant_name

ORDER BY orders_25_to_26_pct;



-- mumbai restaurant analysis 

SELECT
    r.restaurant_name,

    -- Orders
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END) AS orders_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) AS orders_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) AS orders_2026,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN 1 ELSE 0 END),
        1
    ) AS orders_24_to_25_pct,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN 1 ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN 1 ELSE 0 END),
        1
    ) AS orders_25_to_26_pct,

    -- Revenue
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END) AS revenue_2024,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) AS revenue_2025,
    SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) AS revenue_2026,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2024 THEN o.revenue ELSE 0 END),
        1
    ) AS revenue_24_to_25_pct,

    ROUND(
        (
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2026 THEN o.revenue ELSE 0 END) -
            SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END)
        ) * 100.0 /
        SUM(CASE WHEN YEAR(o.order_timestamp) = 2025 THEN o.revenue ELSE 0 END),
        1
    ) AS revenue_25_to_26_pct

FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id

WHERE r.city = 'Mumbai'
  AND MONTH(o.order_timestamp) <= 4

GROUP BY r.restaurant_name

ORDER BY orders_25_to_26_pct;