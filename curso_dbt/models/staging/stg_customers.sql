SELECT
    customer_id,
    first_name,
    last_name,
    email,
    country
FROM {{ source('ecommerce', 'customers') }}