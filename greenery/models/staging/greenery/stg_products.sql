{{
  config(
    materialized='view'
  )
}}

WITH products AS(
  SELECT *
  FROM {{ source('greenery', 'products') }}
)

SELECT 
  product_id as product_id
  , inventory
  , name
  , price
FROM products