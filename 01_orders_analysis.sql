SELECT
    strftime('%Y-%m', order_purchase_timestamp) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;
SELECT
    strftime('%Y-%m', order_purchase_timestamp) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY total_orders DESC
LIMIT 5;
SELECT
    strftime('%Y-%m', order_purchase_timestamp) AS order_month,
    COUNT(*) AS total_orders
FROM orders
WHERE order_purchase_timestamp >= '2017-01-01'
  AND order_purchase_timestamp < '2018-01-01'
GROUP BY order_month
ORDER BY order_month;
WITH monthly_orders AS (
    SELECT
        strftime('%Y-%m', order_purchase_timestamp) AS order_month,
        COUNT(*) AS total_orders
    FROM orders
    WHERE order_purchase_timestamp >= '2017-01-01'
      AND order_purchase_timestamp < '2018-01-01'
    GROUP BY order_month
)
SELECT
    order_month,
    total_orders,
    LAG(total_orders) OVER (
        ORDER BY order_month
    ) AS previous_month_orders
FROM monthly_orders
ORDER BY order_month;
WITH monthly_orders AS (
    SELECT
        strftime('%Y-%m', order_purchase_timestamp) AS order_month,
        COUNT(*) AS total_orders
    FROM orders
    WHERE order_purchase_timestamp >= '2017-01-01'
      AND order_purchase_timestamp < '2018-01-01'
    GROUP BY order_month
),
monthly_comparison AS (
    SELECT
        order_month,
        total_orders,
        LAG(total_orders) OVER (
            ORDER BY order_month
        ) AS previous_month_orders
    FROM monthly_orders
)
SELECT
    order_month,
    total_orders,
    previous_month_orders,
    ROUND(
        (total_orders - previous_month_orders) * 100.0
        / NULLIF(previous_month_orders, 0),
        2
    ) AS mom_growth_percent
FROM monthly_comparison
ORDER BY order_month;