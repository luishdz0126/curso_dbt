{{
    config(
        materialized='incremental',
        unique_key='payment_id'
    )
}}

SELECT 
*
FROM {{ ref('stg_payments') }}

{% if is_incremental() %}
    WHERE payment_id NOT IN (SELECT payment_id FROM {{ this }})
{% endif %}