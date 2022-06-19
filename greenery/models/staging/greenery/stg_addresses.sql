{{
  config(
    materialized='view'
  )
}}

WITH addresses AS(
  SELECT *
  FROM {{ source('greenery', 'addresses') }}
)

SELECT 
    address_id as address_id
    , address
    , country
    , state
    , zipcode
FROM addresses