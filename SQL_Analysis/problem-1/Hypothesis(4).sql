/*
Business Problem:
Revenue is inconsistent over time, showing fluctuations across different periods.

Hypothesis:
Increase in the discounts is causing revenue inconsistency.

Objective:
Analyze the relationship between delivered order volume and actual revenue trends to determine whether changes in the number of successful orders are responsible for revenue fluctuations.
*/

-- =====================================================
-- STEP 1 : CALCULATING OVERALL KPI
-- =====================================================

-- What is the total amount of discount 
SELECT
    SUM(discount_amount) AS total_discount
FROM orders
WHERE order_status = 'Delivered';


-- What  is the avg discount per order 

SELECT
    ROUND(SUM(discount_amount),2) AS total_discount,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(discount_amount) / COUNT(order_id),2) AS avg_discount_per_order
FROM orders
WHERE order_status = 'Delivered';

-- Total orders 

select count(order_id)as total_orders
from orders
where order_status="Delivered";

-- DISCOUNT AMOUNT IN 2024 AND 2025 

select year(order_timestamp)as year_of,
sum(discount_amount)as total_discount,
sum(revenue)as total_revenue
from orders 
where order_status="Delivered"
group by year(order_timestamp);

-- since 2026 has only four months analyse four months

SELECT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    ROUND(SUM(discount_amount),2) AS total_discount_amount,
    ROUND(SUM(revenue),2) AS total_revenue

FROM orders

WHERE YEAR(order_timestamp) = 2026
  AND MONTH(order_timestamp) BETWEEN 1 AND 4
  AND order_status = 'Delivered'

GROUP BY
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)

ORDER BY
    month_no;
    
    -- 2025 ANALYSIS FOR TOTAL DISCOUNT AND REVENUE 

SELECT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    ROUND(SUM(discount_amount),2) AS total_discount_amount,
    ROUND(SUM(revenue),2) AS total_revenue

FROM orders

WHERE YEAR(order_timestamp) = 2025
  AND order_status = 'Delivered'

GROUP BY
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)

ORDER BY
    month_no;
    
        
    -- 2024 ANALYSIS FOR TOTAL DISCOUNT AND REVENUE 

SELECT
    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,
    ROUND(SUM(discount_amount),2) AS total_discount_amount,
    ROUND(SUM(revenue),2) AS total_revenue

FROM orders

WHERE YEAR(order_timestamp) = 2024
  AND order_status = 'Delivered'

GROUP BY
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)

ORDER BY
    month_no;

/*
============================================================
Monthly Discount Amount vs Revenue Comparison
January - April (2024, 2025, 2026)
============================================================
*/

SELECT

    MONTH(order_timestamp) AS month_no,
    MONTHNAME(order_timestamp) AS month_name,

    -- Discount Amount
    ROUND(SUM(CASE
        WHEN YEAR(order_timestamp) = 2024 THEN discount_amount
        ELSE 0
    END),2) AS discount_2024,

    ROUND(SUM(CASE
        WHEN YEAR(order_timestamp) = 2025 THEN discount_amount
        ELSE 0
    END),2) AS discount_2025,

    ROUND(SUM(CASE
        WHEN YEAR(order_timestamp) = 2026 THEN discount_amount
        ELSE 0
    END),2) AS discount_2026,

    -- Revenue
    ROUND(SUM(CASE
        WHEN YEAR(order_timestamp) = 2024 THEN revenue
        ELSE 0
    END),2) AS revenue_2024,

    ROUND(SUM(CASE
        WHEN YEAR(order_timestamp) = 2025 THEN revenue
        ELSE 0
    END),2) AS revenue_2025,

    ROUND(SUM(CASE
        WHEN YEAR(order_timestamp) = 2026 THEN revenue
        ELSE 0
    END),2) AS revenue_2026

FROM orders

WHERE order_status = 'Delivered'
  AND YEAR(order_timestamp) IN (2024, 2025, 2026)
  AND MONTH(order_timestamp) BETWEEN 1 AND 4

GROUP BY
    MONTH(order_timestamp),
    MONTHNAME(order_timestamp)

ORDER BY
    month_no;