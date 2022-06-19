{{
  config(
    materialized = 'table'
  )
}}

WITH addresses AS (
    SELECT
        address_id,
        address,
        country
        state,
        zipcode
    FROM {{ ref('stg_addresses') }}
)

select * from addresses