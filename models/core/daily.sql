{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('stg_citibike_tripdata') }}
)

select 
    -- Date grouping
    {{ dbt.date_trunc("day", "started_at") }} as ride_date,

    -- Ride statistics
    count(ride_id) as total_daily_rides,

    -- Ride type breakdown
    count(case when member_casual = 'member' then ride_id end) as total_member_rides,
    count(case when member_casual = 'casual' then ride_id end) as total_casual_rides,

    -- Rideable Type Breakdown
    count(case when rideable_type = 'electric_bike' then ride_id end) as total_electric_bike_rides,
    count(case when rideable_type = 'classic_bike' then ride_id end) as total_classic_bike_rides,
    count(case when rideable_type = 'docked_bike' then ride_id end) as total_docked_bike_rides,

    -- Average trip duration
    --avg(extract(epoch from (ended_at_time - started_at)) / 60) as avg_trip_duration_minutes

from trips_data
group by 1
order by 1
