{{
    config(
        materialized='table'
    )
}}

with tripdata as 
(
  select *,
    row_number() over(partition by ride_id, started_at) as rn
  from {{ source('core','citibike_tripdata') }}
  where ride_id is not null 
)
select
    -- identifiers
    --{{ dbt_utils.generate_surrogate_key(['vendorid', 'lpep_pickup_datetime']) }} as tripid,
   -- {{ dbt.safe_cast("vendorid", api.Column.translate_type("integer")) }} as vendorid,

    ride_id,
    rideable_type,
    cast(started_at as timestamp) as started_at,
    cast(ended_at as timestamp) as ended_at_time,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    cast(start_lat as numeric) as start_lat,
    cast(start_lng as numeric) as start_lng,
    cast(end_lat as numeric) as end_lat,
    cast(end_lng as numeric) as end_lng,
    member_casual
from tripdata
where rn = 1


-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}