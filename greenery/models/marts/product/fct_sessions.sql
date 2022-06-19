
{{
  config(
    materialized = 'table'
  )
}}

with session_length as (
  select 
    session_id
    , min(created_at_utc) as first_event
    , max(created_at_utc) as last_event
  from {{ ref('stg_events')}}
  group by 1
)

SELECT
  int_session.session_id
  , int_session.user_id
  , stg_user.first_name
  , stg_user.last_name
  , stg_user.email
  , int_session.page_view
  , int_session.add_to_cart
  , int_session.checkout
  , int_session.package_shipped
  , session_length.first_event as first_session_event
  , session_length.last_event as last_session_event
  , (DATE_PART('DAY', session_length.last_event::timestamp - session_length.first_event::timestamp) * 24 +
    DATE_PART('HOUR', session_length.last_event::timestamp - session_length.first_event::timestamp)) * 60 +
    DATE_PART('MINUTE', session_length.last_event::timestamp - session_length.first_event::timestamp)
    AS session_length_minutes
from {{  ref('int_session_events_basic_agg')  }} int_session
left join {{  ref('stg_users')  }} stg_user
    on int_session.user_id = stg_user.user_id
left join session_length
    on int_session.session_id = session_length.session_id