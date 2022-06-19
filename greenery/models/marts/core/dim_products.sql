{{
  config(
    materialized = 'table'
  )
}}

SELECT
  product_id
  , inventory as number_in_stock
  , name
  , price
FROM {{ ref('stg_products') }}
