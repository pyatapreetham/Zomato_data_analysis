-- Hypothesis 3 : High return rates are causing restaurants to underperform.

-- Overall Return Rate

SELECT
    COUNT(CASE WHEN order_status = 'Refunded' THEN 1 END) AS refunded_orders,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(CASE WHEN order_status = 'Refunded' THEN 1 END) * 100.0 /
        COUNT(order_id),
        2
    ) AS refund_rate
FROM orders;


-- Year-wise Refund Rate (Jan–Apr)

SELECT
    YEAR(order_timestamp) AS year,
    COUNT(CASE WHEN order_status = 'Refunded' THEN 1 END) AS refunded_orders,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(CASE WHEN order_status = 'Refunded' THEN 1 END) * 100.0 /
        COUNT(order_id),
        2
    ) AS refund_rate
FROM orders
WHERE MONTH(order_timestamp) BETWEEN 1 AND 4
GROUP BY YEAR(order_timestamp)
ORDER BY YEAR(order_timestamp);

-- 

-- City-wise Refund Rate (Jan–Apr)

SELECT
    r.city,
    YEAR(o.order_timestamp) AS year,
    COUNT(CASE WHEN o.order_status = 'Refunded' THEN 1 END) AS refunded_orders,
    COUNT(o.order_id) AS total_orders,
    ROUND(
        COUNT(CASE WHEN o.order_status = 'Refunded' THEN 1 END) * 100.0 /
        COUNT(o.order_id),
        2
    ) AS refund_rate
FROM orders o
JOIN restaurants r
ON o.restaurant_id = r.restaurant_id
WHERE r.city IN ('Pune', 'Mumbai', 'Delhi', 'Gurugram')
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4
GROUP BY
    r.city,
    YEAR(o.order_timestamp)
ORDER BY
    r.city,
    YEAR(o.order_timestamp);
    
    
    /* 
    ============================
     PUNE CITY RESTAURANT ANALYSIS 
     ============================
     
     */
     
     -- orders vs refund rate 
     
     SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,
    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Pune'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
-- revenue vs refund rate 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,

    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,

    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.order_status='Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ),2
    ) AS total_revenue

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Pune'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;
    
    
    
     /* 
    ============================
     MUMBAI CITY RESTAURANT ANALYSIS 
     ============================
     
     */
     
     -- orders vs refund rate 
     
     SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,
    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Mumbai'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
-- revenue vs refund rate 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,

    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,

    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.order_status='Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ),2
    ) AS total_revenue

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Mumbai'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;
    
    
    
     /* 
    ============================
     DELHI CITY RESTAURANT ANALYSIS 
     ============================
     
     */
     
     -- orders vs refund rate 
     
     SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,
    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Delhi'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
-- revenue vs refund rate 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,

    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,

    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.order_status='Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ),2
    ) AS total_revenue

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Delhi'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;
    
    
     /* 
    ============================
     Gurugram CITY RESTAURANT ANALYSIS 
     ============================
     
     */
     
     -- orders vs refund rate 
     
     SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,
    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,
    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Gurugram'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_orders DESC;
    
-- revenue vs refund rate 

SELECT
    r.restaurant_name,
    YEAR(o.order_timestamp) AS year,

    ROUND(
        COUNT(CASE WHEN o.order_status='Refunded' THEN 1 END)*100.0/
        COUNT(o.order_id),2
    ) AS refund_rate,

    COUNT(CASE WHEN o.order_status='Delivered' THEN 1 END) AS total_orders,

    ROUND(
        SUM(
            CASE
                WHEN o.order_status='Delivered'
                THEN o.order_amount
                ELSE 0
            END
        ),2
    ) AS total_revenue

FROM restaurants r
JOIN orders o
ON r.restaurant_id=o.restaurant_id

WHERE r.city='Gurugram'
AND MONTH(o.order_timestamp) BETWEEN 1 AND 4

GROUP BY
    r.restaurant_name,
    YEAR(o.order_timestamp)

ORDER BY
    YEAR(o.order_timestamp),
    total_revenue DESC;
    
    