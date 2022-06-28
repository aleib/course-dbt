{{
  config(
    materialized = 'table'
  )
}}

SELECT
  u.user_id
  , u.email
  , u.first_name
  , u.last_name
  , u.phone_number

  , u.created_at_utc
  , u.updated_at_utc

  , a.address_id
  , a.address
  , a.zipcode
  , a.state
  , a.country
FROM {{ ref('stg_users') }} u
LEFT JOIN {{ ref('stg_addresses')}} a 
  on u.address_id = a.address_id