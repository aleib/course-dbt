{{
  config(
    materialized='view'
  )
}}

SELECT 
    orders.order_id
    , orders.address_id as order_address_id
    , orders.created_at_utc as order_created_at_utc
    , orders.delivered_at_utc
    , orders.estimated_delivery_at
    , orders.order_cost
    , orders.order_total as order_total_cost
    , orders.shipping_cost
    , orders.shipping_service
    , orders.status as order_status
    , orders.tracking_id
    , orders.user_id
    , promos.discount_usd AS promo_discount_usd
    , promos.promo_id
    , CASE WHEN orders.promo_id IS NOT NULL THEN true ELSE false END AS has_promo_code
FROM {{ ref('stg_orders') }} orders
LEFT JOIN {{ ref('stg_promos') }} promos ON orders.promo_id = promos.promo_id