/* 
============================================================
Hypothesis 3 : Cancellation rates causing the flactuations in the revenue 

*/

-- What is the count of total cancelled orders

select count(order_id)as cancelled_orders
from orders
where order_status="Cancelled";

-- Total cancellation rate 

SELECT
COUNT(*) AS total_orders,
SUM(CASE WHEN order_status='Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,

ROUND(
SUM(CASE WHEN order_status='Cancelled' THEN 1 ELSE 0 END)*100.0
/COUNT(*),2) AS cancellation_rate
FROM orders;

-- yearly compairsons 

/*
============================================================
Hypothesis 3 : Cancellation rates causing fluctuations in revenue

Objective:
Analyze whether increase in cancellation rate is affecting
delivered orders and delivered revenue.

Analysis Period:
January - April (2024, 2025, 2026)

============================================================
*/


SELECT

    YEAR(order_timestamp) AS year,

    -- Total Orders
    COUNT(order_id) AS total_orders,


    -- Cancelled Orders
    SUM(
        CASE 
            WHEN order_status = 'Cancelled'
            THEN 1
            ELSE 0
        END
    ) AS cancelled_orders,


    -- Delivered Orders
    SUM(
        CASE 
            WHEN order_status = 'Delivered'
            THEN 1
            ELSE 0
        END
    ) AS delivered_orders,


    -- Cancellation Rate
    ROUND(
        SUM(
            CASE 
                WHEN order_status = 'Cancelled'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(order_id),
        2
    ) AS cancellation_rate,


    -- Actual Revenue Earned
    ROUND(
        SUM(
            CASE
                WHEN order_status = 'Delivered'
                THEN revenue
                ELSE 0
            END
        ),
        2
    ) AS delivered_revenue


FROM orders


WHERE MONTH(order_timestamp) BETWEEN 1 AND 4


GROUP BY YEAR(order_timestamp)


ORDER BY year;