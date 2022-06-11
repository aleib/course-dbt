{{
  config(
    materialized='table'
  )
}}

WITH events AS(
  SELECT *
  FROM {{ source('greenery', 'events') }}
)

SELECT 
  event_id
  , created_at
  , event_type
  , order_id
  , page_url
  , product_id
  , session_id
  , user_id
FROM events