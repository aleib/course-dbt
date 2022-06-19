{{
  config(
    materialized='view'
  )
}}

WITH promos AS(
  SELECT *
  FROM {{ source('greenery', 'promos') }}
)

SELECT 
  promo_id as promo_id
  , discount as discount_usd
  , status
FROM promos