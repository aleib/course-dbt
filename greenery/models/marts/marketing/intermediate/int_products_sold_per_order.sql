{{
  config(
    materialized='table'
  )
}}

select  
  order_items.order_id
  , products.product_id
  , sum(order_items.quantity) as number_sold_per_order
  , products.name as product_name
from {{ ref ('stg_order_items') }} order_items
left outer join {{ ref ('stg_products') }} products
  on order_items.product_id = products.product_id
group by 
  order_items.order_id
  , products.product_id
  , order_items.quantity
  , products.name
order by order_items.order_id