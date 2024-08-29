WITH cleaned_customers AS (
    SELECT
        customer_id,
        TRIM(customer_name) AS customer_name,
        TRIM(customer_email) AS customer_email,
        TRIM(customer_phone) AS customer_phone
    FROM {{ source('sales', 'raw_customers') }}
    WHERE customer_id IS NOT NULL
      AND customer_name IS NOT NULL
      AND customer_email IS NOT NULL
      AND customer_phone IS NOT NULL
)

SELECT
    customer_id,
    customer_name,
    customer_email,
    customer_phone
FROM cleaned_customers;