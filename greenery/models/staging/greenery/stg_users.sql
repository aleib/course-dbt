{{
  config(
    materialized='view'
  )
}}

WITH users AS(
  SELECT *
  FROM {{ source('greenery', 'users') }}
)

SELECT 
  user_id as user_id
  , address_id as address_id
  , created_at as created_at_utc
  , email
  , first_name
  , last_name
  , phone_number
  , updated_at as updated_at_utc
FROM users