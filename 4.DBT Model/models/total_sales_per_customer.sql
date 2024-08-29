WITH sales AS (
    SELECT
        o.customer_id,
        SUM(od.quantity * od.price) AS total_sales
    FROM {{ source('sales', 'raw_orders') }} o
    JOIN {{ source('sales', 'raw_order_details') }} od
        ON o.order_id = od.order_id
    WHERE o.order_date >= DATEADD(MONTH, -6, CURRENT_DATE) -- Last 6 months of sales
    GROUP BY o.customer_id
)

SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(s.total_sales, 0) AS total_sales
FROM {{ ref('customers') }} c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id