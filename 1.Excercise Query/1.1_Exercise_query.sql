SELECT
    c.customer_id,
    c.name,
    COALESCE(SUM(od.quantity * od.price),o) AS total_spent
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
JOIN
    Order_Details od ON o.order_id = od.order_id
WHERE
    o.order_date >= DATEADD(MONTH, -6, GETDATE()) -- Last 6 months
GROUP BY
    c.customer_id,
    c.name
ORDER BY
    total_spent DESC;