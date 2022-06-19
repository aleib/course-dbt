{{
  config(
    materialized='table'
  )
}}

SELECT 
    orders.order_id
    , orders.user_id
    , users.first_name
    , users.last_name
    , users.email
    , users.phone_number
    , users.created_at_utc as user_created_at_utc
    , user_orders.is_repeat_customer
    , user_orders.number_of_user_orders
    , orders.address_id as order_address_id
    , orders.created_at_utc
    , CASE WHEN orders.promo_id IS NOT NULL THEN true ELSE false END AS has_promo_code
    , promos.promo_id
    , promos.discount_usd AS promo_discount_usd
    , orders.order_cost
    , orders.shipping_cost
    , orders.order_total
    , orders.status as order_status
    , orders.tracking_id
    , orders.shipping_service
    , orders.estimated_delivery_at as order_estimated_delivery_at
    , orders.delivered_at_utc as order_delivered_at_utc
FROM {{ ref('stg_orders') }} AS orders
JOIN {{ ref('stg_users' )}} AS users 
  ON users.user_id = orders.user_id
LEFT JOIN {{ ref('int_user_orders')}} AS user_orders 
  ON user_orders.user_id = users.user_id
LEFT JOIN {{ ref('stg_promos')}} AS promos 
  ON orders.promo_id = promos.promo_id