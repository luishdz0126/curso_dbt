SELECT
    payment_id,
    order_id,
    payment_method,
    {{ cents_to_dollars('amount_cents') }} AS amount_usd
FROM {{ source('ecommerce', 'payments') }}