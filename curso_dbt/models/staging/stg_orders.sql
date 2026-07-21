SELECT
    order_id,
    customer_id,
    cast(order_date as date) as order_date,
    status,
FROM {{ source('ecommerce', 'orders') }}