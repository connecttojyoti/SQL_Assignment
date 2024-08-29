--Assuming total_amount column contains sum of unit*price
SELECT
    c.customer_id,
    c.name,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
WHERE
    o.order_date >= DATEADD(MONTH, -6, GETDATE())  -- Filter for orders in the last 6 months
GROUP BY
    c.customer_id,
    c.name
ORDER BY
    total_spent DESC; 