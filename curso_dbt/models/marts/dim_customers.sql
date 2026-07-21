WITH customers AS
(
    SELECT * FROM {{ ref('stg_customers') }}
)
SELECT
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} AS customer_key,
    customer_id,
    first_name,
    last_name,
    country
FROM customers