{{
  config(
    materialized = 'table'
  )
}}

select 
  order_id
  , (delivered_at_utc - created_at_utc) as time_to_deliver
from {{ ref('stg_orders')}}