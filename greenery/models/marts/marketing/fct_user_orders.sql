{{
  config(
    materialized='table'
  )
}}

SELECT 
    orders.order_id
    , orders.user_id
    , concat (users.first_name, ' ', users.last_name) as user_name

    , int_uo.first_order
    , int_uo.last_order
    , int_uo.total_orders_lifetime
    , int_uo.total_spends_lifetime
    -- , int_uo.is_repeat_customer
    -- , int_uo.number_of_user_orders

    -- , CASE WHEN orders.promo_id IS NOT NULL THEN true ELSE false END AS has_promo_code
    -- , promos.promo_id
    -- , promos.discount_usd AS promo_discount_usd
    
    , orders.order_cost
    , orders.shipping_cost
    , orders.order_total
    , orders.status as order_status
    , orders.estimated_delivery_at as order_estimated_delivery_at
    , orders.delivered_at_utc as order_delivered_at_utc
FROM {{ ref('stg_orders') }} AS orders
JOIN {{ ref('stg_users' )}} AS users 
  ON users.user_id = orders.user_id
LEFT JOIN {{ ref('int_user_orders')}} AS int_uo 
  ON int_uo.user_id = users.user_id
-- LEFT JOIN {{ ref('stg_promos')}} AS promos 
--   ON orders.promo_id = promos.promo_id