{{
  config(
    materialized='table'
  )
}}

SELECT
  users.user_id
  , min(orders.created_at_utc) as first_order
  , max(orders.created_at_utc) as last_order
  , count(distinct orders.order_id) as total_orders_lifetime
  , sum(orders.order_total) as total_spends_lifetime
  -- , CASE
  --     WHEN order_count.number_of_orders > 1 THEN true
  --     ELSE false
  -- END AS is_repeat_customer
  -- , CASE
  --     WHEN order_count.number_of_orders IS NULL THEN 0
  --     ELSE order_count.number_of_orders
  -- END AS number_of_user_orders
FROM {{ ref('stg_users') }} users
JOIN {{ ref('stg_orders') }} orders 
  ON users.user_id = orders.user_id
GROUP BY users.user_id
-- LEFT JOIN order_count 
--   ON users.user_id = order_count.user_id