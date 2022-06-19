{{
  config(
    materialized = 'table'
  )
}}

SELECT
  promo_id
  , discount_usd
  , status as promo_status
FROM {{ ref('stg_promos') }}