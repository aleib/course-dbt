{{
  config(
    materialized='table'
  )
}}

WITH addresses AS(
  SELECT *
  FROM {{ source('greenery', 'addresses') }}
)

SELECT 
    address_id
    , address
    , country
    , state
    , zipcode
FROM addresses