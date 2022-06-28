{{
  config(
    materialized = 'table'
  )
}}

SELECT
  session_id
  , created_at_utc
  , user_id
  , events.page_url
  , sum(case when event_type = 'page_view' then 1 else 0 end) as page_view
  , sum(case when event_type = 'checkout' then 1 else 0 end) as checkout
  , sum(case when event_type = 'add_to_card' then 1 else 0 end) as add_to_cart
  , sum(case when event_type = 'package_shipped' then 1 else 0 end) as package_shipped
FROM {{ ref ('stg_events') }} AS events
GROUP BY 1,2,3,4