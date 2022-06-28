{{
    config(
        materialized='table'
    )
}}

select
    session_id,
    min(created_at_utc) as first_event,
    max(created_at_utc) as last_event
from 
    {{ ref('stg_events')}}
group by 
    session_id