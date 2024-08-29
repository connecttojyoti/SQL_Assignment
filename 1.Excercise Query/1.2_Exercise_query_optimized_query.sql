WITH CustomerTotalSpent AS (
    SELECT
        o.customer_id,
        SUM(od.quantity * od.price) AS total_spent
    FROM
        Orders o
    JOIN
        Order_Details od ON o.order_id = od.order_id
    WHERE
        o.order_date >= DATEADD(MONTH, -6, GETDATE()) -- Last 6 months
    GROUP BY
        o.customer_id
)
SELECT
    c.customer_id,
    c.name,
    COALESCE(cts.total_spent, 0) AS total_spent
FROM
    Customers c
LEFT JOIN
    CustomerTotalSpent cts ON c.customer_id = cts.customer_id
ORDER BY
    total_spent DESC;