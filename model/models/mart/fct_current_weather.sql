--this table will contains the information about each row of the weather
with source as(
    select * from {{ ref('raw_data_weather') }}
)
, countries as(
    select * 
    from {{ ref('stg_countries') }}
)
, dates as(
    select * 
    from {{ ref('stg_dates') }}
)
, time as(
    select * 
    from {{ ref('stg_times') }}
)
,weather_condition as(
    select *
    from {{ ref('stg_weather_condition') }}
)
,getting_max_timestamp as(
select max(source.datetime_timestamp) as updated_time_aka_current,
source.temperature,
source.humidity,
countries.country_name,
weather_condition.weather_condition
from source
join countries
on source.country_id = countries.country_id
join weather_condition
on source.weather_condition = weather_condition.weather_condition
group by 2,3,4,5
)
,sort_out_current_date as(
select updated_time_aka_current,
temperature,
humidity,
country_name,
weather_condition,
rank()over(order by updated_time_aka_current desc) as rn
from getting_max_timestamp
)
,getting_overall_avg_temp_and_humidity as (
select updated_time_aka_current,
country_name,
temperature,
humidity,
weather_condition,
round(avg(temperature)over(),2) as overall_avg_temperature,
round(avg(humidity)over(),2) as overall_avg_humidity
from sort_out_current_date
where rn = 1
)
,final as(
    select * from getting_overall_avg_temp_and_humidity
)
select * from final