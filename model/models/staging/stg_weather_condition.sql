--finding the weather condition
with weather_source AS(
    select 
        distinct  weather_condition,
        weather
    from {{ ref('raw_data_weather') }}
)
,final as(
    select * from weather_source
)
select * from final