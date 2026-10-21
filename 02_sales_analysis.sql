SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    ROUND(SUM(oi.price), 2) AS monthly_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY order_month
ORDER BY order_month;
WITH monthly_revenue AS (
    SELECT
        strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
        SUM(oi.price) AS revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
	AND o.order_purchase_timestamp >= '2017-01-01'
AND o.order_purchase_timestamp < '2018-01-01'
    GROUP BY order_month
),
revenue_comparison AS (
    SELECT
        order_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY order_month
        ) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT
    order_month,
    ROUND(revenue, 2) AS monthly_revenue,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,
    ROUND(
        (revenue - previous_month_revenue) * 100.0
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_growth_percent
FROM revenue_comparison
ORDER BY order_month;
SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
  AND o.order_purchase_timestamp >= '2017-10-01'
  AND o.order_purchase_timestamp < '2017-12-01'
GROUP BY order_month
ORDER BY order_month;
SELECT
    DATE(o.order_purchase_timestamp) AS order_date,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS daily_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
    AND o.order_purchase_timestamp >= '2017-11-01'
    AND o.order_purchase_timestamp < '2017-12-01'
GROUP BY order_date
ORDER BY daily_revenue DESC
LIMIT 10;
WITH daily_sales AS (
    SELECT
        DATE(o.order_purchase_timestamp) AS order_date,
        ROUND(SUM(oi.price), 2) AS daily_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_purchase_timestamp >= '2017-11-01'
      AND o.order_purchase_timestamp < '2017-12-01'
    GROUP BY DATE(o.order_purchase_timestamp)
)
SELECT
    ROUND(AVG(daily_revenue), 2) AS avg_daily_revenue,
    MAX(daily_revenue) AS highest_daily_revenue,
    MIN(daily_revenue) AS lowest_daily_revenue
FROM daily_sales;
WITH daily_sales AS (
    SELECT
        DATE(o.order_purchase_timestamp) AS order_date,
        SUM(oi.price) AS daily_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_purchase_timestamp >= '2017-11-01'
      AND o.order_purchase_timestamp < '2017-12-01'
    GROUP BY DATE(o.order_purchase_timestamp)
)
SELECT
    ROUND(AVG(daily_revenue), 2) AS avg_revenue_excluding_black_friday
FROM daily_sales
WHERE order_date <> '2017-11-24';