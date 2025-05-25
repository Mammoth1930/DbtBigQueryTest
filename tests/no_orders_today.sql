-- Test to check there have been no orders from today

SELECT COUNT(*) AS num_orders_today
FROM {{ ref('stg_orders') }}
-- WHERE DATE(order_date) = DATE('2021-03-21') -- To fail test uncomment
WHERE DATE(order_date) = CURRENT_DATE
GROUP BY order_date
HAVING COUNT(*) > 0