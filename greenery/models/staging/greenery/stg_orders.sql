{{
  config(
    materialized='table'
  )
}}

WITH orders AS(
  SELECT *
  FROM {{ source('greenery', 'orders') }}
)

SELECT 
  order_id
  , address_id
  , created_at
  , delivered_at
  , estimated_delivery_at
  , order_cost
  , order_total
  , promo_id
  , shipping_cost
  , shipping_service
  , status
  , tracking_id
  , user_id
FROM orders
