{{
  config(
    materialized = 'table'
  )
}}

SELECT
  user_id

  , email
  , first_name
  , last_name
  , phone_number

  , created_at_utc
  , updated_at_utc

  , address_id
FROM {{ ref('stg_users') }}