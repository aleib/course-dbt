
{{
  config(
    materialized = 'table'
  )
}}

SELECT
  int_session.session_id
  , int_session.user_id
  , stg_user.first_name
  , stg_user.last_name
  , int_session.page_view
  , int_session.add_to_cart
  , int_session.checkout
  , int_session.package_shipped
  , int_session_length.first_event as first_session_event
  , int_session_length.last_event as last_session_event
  , (DATE_PART('DAY', int_session_length.last_event::timestamp - int_session_length.first_event::timestamp) * 24 +
    DATE_PART('HOUR', int_session_length.last_event::timestamp - int_session_length.first_event::timestamp)) * 60 +
    DATE_PART('MINUTE', int_session_length.last_event::timestamp - int_session_length.first_event::timestamp)
    AS session_length_minutes
from {{ ref('int_session_events_agg') }} as int_session
left join {{ ref('stg_users') }} as stg_user
    on int_session.user_id = stg_user.user_id
left join {{ ref('int_session_length') }} as int_session_length
    on int_session_length.session_id = int_session.session_id