/* PROBLEM STATEMENT 2 : RESTAURANTS ARE UNDERPERFORMING 
*/

/*
Based on the findings from Problem 1, the analysis is limited to Pune, Delhi, Mumbai, and Gurugram, as 
these cities contributed most significantly to the decline in delivered revenue. The restaurant-level
investigation focuses on identifying the factors responsible for the underperformance of restaurants within
these cities.

*/


-- Lower customer ratings are causing restaurants to underperform.

SELECT
    restaurant_name,
    ROUND(AVG(avg_rating), 2) AS avg_rating
FROM restaurants
WHERE city = 'Pune'
GROUP BY restaurant_name
ORDER BY avg_rating DESC;

-- YEARLY COMPARISIONS FOR 2024 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Pune'
  AND YEAR(o.order_timestamp) = 2024
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    rating DESC;
    
    
-- YEAR 2025

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Pune'
  AND YEAR(o.order_timestamp) = 2025
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    rating DESC;

-- YEAR 2026

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Pune'
  AND YEAR(o.order_timestamp) = 2026
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    rating DESC;
    
-- does the avg rating has any impact on the restaurant's revenue in pune 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating, 2) AS rating,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue), 2) AS total_revenue
FROM restaurants r
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Pune'
  AND o.order_status = 'Delivered' AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;


-- orders vs rating 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating,2) AS rating,
    COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Pune'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
AND o.order_status = 'Delivered'
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
    -- ================MUMBAI CITY RESTAURANT ANALYSIS ======================
    -- Lower customer ratings are causing restaurants to underperform.

SELECT
    restaurant_name,
    ROUND(AVG(avg_rating), 2) AS avg_rating
FROM restaurants
WHERE city = 'Pune'
GROUP BY restaurant_name
ORDER BY avg_rating DESC;

-- YEARLY COMPARISIONS FOR 2024 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Mumbai'
  AND YEAR(o.order_timestamp) = 2024
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    rating DESC;
    
    
-- YEAR 2025

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Mumbai'
  AND YEAR(o.order_timestamp) = 2025
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    rating DESC;

-- YEAR 2026

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Mumbai'
  AND YEAR(o.order_timestamp) = 2026
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    rating DESC;
    
-- does the avg rating has any impact on the restaurant's revenue in pune 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating, 2) AS rating,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue), 2) AS total_revenue
FROM restaurants r
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Mumbai'
  AND o.order_status = 'Delivered' AND MONTH(o.order_timestamp)<=4
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;


-- orders vs rating 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating,2) AS rating,
    COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Mumbai'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
AND o.order_status = 'Delivered'
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
    -- ================= DELHI CITY RESTAURANT ANALYSIS ======================
-- Hypothesis: Lower customer ratings are causing restaurants to underperform.

SELECT
    restaurant_name,
    ROUND(AVG(avg_rating), 2) AS avg_rating
FROM restaurants
WHERE city = 'Delhi'
GROUP BY restaurant_name
ORDER BY avg_rating DESC;

-- YEARLY COMPARISON - 2024

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Delhi'
AND YEAR(o.order_timestamp) = 2024
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY rating DESC;

-- YEARLY COMPARISON - 2025

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Delhi'
AND YEAR(o.order_timestamp) = 2025
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY rating DESC;

-- YEARLY COMPARISON - 2026

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Delhi'
AND YEAR(o.order_timestamp) = 2026
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY rating DESC;

-- Revenue vs Rating

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating,2) AS rating,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue),2) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Delhi'
AND MONTH(o.order_timestamp) <= 4
AND o.order_status = 'Delivered'
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;

-- Orders vs Rating

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating,2) AS rating,
    COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Delhi'
AND MONTH(o.order_timestamp) <= 4
AND o.order_status = 'Delivered'
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
    -- ================= GURUGRAM CITY RESTAURANT ANALYSIS ======================
-- Hypothesis: Lower customer ratings are causing restaurants to underperform.

SELECT
    restaurant_name,
    ROUND(AVG(avg_rating), 2) AS avg_rating
FROM restaurants
WHERE city = 'Gurugram'
GROUP BY restaurant_name
ORDER BY avg_rating DESC;

-- YEARLY COMPARISON - 2024

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Gurugram'
AND YEAR(o.order_timestamp) = 2024
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY rating DESC;

-- YEARLY COMPARISON - 2025

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Gurugram'
AND YEAR(o.order_timestamp) = 2025
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY rating DESC;

-- YEARLY COMPARISON - 2026

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS yearly_change,
    ROUND(r.avg_rating, 2) AS rating
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Gurugram'
AND YEAR(o.order_timestamp) = 2026
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY rating DESC;

-- Revenue vs Rating

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating,2) AS rating,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.revenue),2) AS total_revenue
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Gurugram'
AND MONTH(o.order_timestamp) <= 4
AND o.order_status = 'Delivered'
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;

-- Orders vs Rating

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(r.avg_rating,2) AS rating,
    COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE r.city = 'Gurugram'
AND MONTH(o.order_timestamp) <= 4
AND o.order_status = 'Delivered'
GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp),
    r.avg_rating
ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;