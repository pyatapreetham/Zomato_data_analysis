/* PROBLEM STATEMENT 2 : RESTAURANTS ARE UNDERPERFORMING 
*/

/*
Based on the findings from Problem 1, the analysis is limited to Pune, Delhi, Mumbai, and Gurugram, as 
these cities contributed most significantly to the decline in delivered revenue. The restaurant-level
investigation focuses on identifying the factors responsible for the underperformance of restaurants within
these cities.

*/


-- Higher cancellation rates causing the restaurants under performing 

-- what is the total cancel rate ?

select count(order_id)as cancelled_orders
from orders
where order_status="Cancelled";

-- Cancellation rate 

select 
count(case when order_status="Cancelled" then 1 end)as cancelled_orders,
ROUND(COUNT(case when order_status="Cancelled" then 1 end)*100.0 / count(order_id),2)as cancellation_rate
from orders;

-- ================= PUNE CITY RESTAURANT ANALYSIS ======================

-- Hypothesis: High cancellation rates are causing restaurants to underperform.

SELECT
    r.restaurant_name,
    ROUND(
        COUNT(CASE WHEN o.order_status='Cancelled' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS cancellation_rate
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city='Pune'
AND MONTH(o.order_timestamp) <=4
GROUP BY r.restaurant_name
ORDER BY cancellation_rate DESC;


-- YEARLY COMPARISON - 2024

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(
        COUNT(CASE WHEN o.order_status='Cancelled' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS cancellation_rate
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city='Pune'
AND YEAR(o.order_timestamp)=2024
AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY cancellation_rate DESC;


-- YEARLY COMPARISON - 2025

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(
        COUNT(CASE WHEN o.order_status='Cancelled' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS cancellation_rate
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city='Pune'
AND YEAR(o.order_timestamp)=2025
AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY cancellation_rate DESC;


-- YEARLY COMPARISON - 2026

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(
        COUNT(CASE WHEN o.order_status='Cancelled' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS cancellation_rate
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city='Pune'
AND YEAR(o.order_timestamp)=2026
AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY cancellation_rate DESC;


-- Revenue vs Cancellation Rate

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status='Cancelled' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS cancellation_rate,
    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS delivered_orders,
    ROUND(
        SUM(CASE
            WHEN o.order_status='Delivered'
            THEN o.order_amount
            ELSE 0
        END),2
    ) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city='Pune'
AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;


-- Orders vs Cancellation Rate

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status='Cancelled' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS cancellation_rate,
    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city='Pune'
AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
    -- ================= MUMBAI CITY RESTAURANT ANALYSIS ======================

-- Hypothesis: High cancellation rates are causing restaurants to underperform.

-- Orders vs Cancellation Rate

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) * 100.0 /
        COUNT(o.order_id), 2
    ) AS cancellation_rate,
    COUNT(CASE WHEN o.order_status = 'Delivered' THEN 1 END) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Mumbai'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    

-- Revenue vs Cancellation Rate

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) * 100.0 /
        COUNT(o.order_id), 2
    ) AS cancellation_rate,
    COUNT(CASE WHEN o.order_status = 'Delivered' THEN 1 END) AS total_orders,
    ROUND(
        SUM(
            CASE
                WHEN o.order_status = 'Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ), 2
    ) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Mumbai'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;
    
    
-- ================= DELHI CITY RESTAURANT ANALYSIS ======================

-- Hypothesis: High cancellation rates are causing restaurants to underperform.

-- Orders vs Cancellation Rate

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) * 100.0 /
        COUNT(o.order_id), 2
    ) AS cancellation_rate,
    COUNT(CASE WHEN o.order_status = 'Delivered' THEN 1 END) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Delhi'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
    
    -- =====================================================================
-- Revenue vs Cancellation Rate


SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,

    ROUND(
        COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) * 100.0
        / COUNT(o.order_id),
        2
    ) AS cancellation_rate,

    COUNT(CASE
            WHEN o.order_status = 'Delivered'
            THEN 1
          END) AS total_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.order_status = 'Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ),
        2
    ) AS total_revenue

FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id

WHERE r.city = 'Delhi'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;
    
    
   --  ================= Gurugram CITY RESTAURANT ANALYSIS ======================

-- Hypothesis: High cancellation rates are causing restaurants to underperform.

-- Orders vs Cancellation Rate

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) * 100.0 /
        COUNT(o.order_id), 2
    ) AS cancellation_rate,
    COUNT(CASE WHEN o.order_status = 'Delivered' THEN 1 END) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Gurugram'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
    
    -- =====================================================================
-- Revenue vs Cancellation Rate


SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,

    ROUND(
        COUNT(CASE WHEN o.order_status = 'Cancelled' THEN 1 END) * 100.0
        / COUNT(o.order_id),
        2
    ) AS cancellation_rate,

    COUNT(CASE
            WHEN o.order_status = 'Delivered'
            THEN 1
          END) AS total_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.order_status = 'Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ),
        2
    ) AS total_revenue

FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id

WHERE r.city = 'Gurugram'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;