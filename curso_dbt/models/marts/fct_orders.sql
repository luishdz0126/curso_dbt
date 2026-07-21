WITH orders AS
(
    SELECT * FROM {{ ref('stg_orders') }}
),
payments AS
(
    SELECT * FROM {{ source('ecommerce', 'payments') }}
),
order_payments AS
(
    SELECT
    order_id,
    SUM(amount_cents) / 100.00 AS total_amount
    FROM payments 
    GROUP BY 1
)
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    COALESCE(p.total_amount, 0) AS amount
FROM orders o
LEFT JOIN order_payments p USING (order_id)