{{
  config(
    materialized='view'
  )
}}

WITH order_count AS (
  SELECT 
    user_id
    , COUNT(DISTINCT order_id) as number_of_orders
  FROM {{ ref('stg_orders' ) }}
  GROUP BY user_id
)

SELECT 
  users.user_id
  , CASE WHEN order_count.number_of_orders > 1 THEN true ELSE false END 
      AS is_repeat_customer
  , CASE WHEN order_count.number_of_orders IS NULL THEN 0 ELSE order_count.number_of_orders END 
      AS number_of_user_orders
FROM {{ ref('stg_users') }} AS users
LEFT JOIN order_count 
  ON users.user_id = order_count.user_id