with
    final as (
        select
            cast(TimeStamps as datetime) as datetime_timestamp,
            extract(date from cast(TimeStamps as datetime)) as date_stamp,
            -- extract(time from cast(TimeStamps as datetime)) as time_stamp, 
            extract(time from timestamp_trunc(cast(TimeStamps as datetime),hour)) as time_stamp,
            base as base,
            visibility,
            id as weather_api_country_id,
            main as weather,
            description as weather_condition,
            name as country_name,
            coordlon as longtitude,
            coordlat as lattitude,
            maintemp as temperature,
            mainfeels_like as temperature_feels_like,
            maintemp_min as temperature_min,
            maintemp_max as temperature_max,
            mainpressure as pressure,
            mainhumidity as humidity,
            mainsea_level as sea_level,
            maingrnd_level as ground_level,
            windspeed as wind_speed,
            winddeg as wind_deg,
            windgust as wind_gust,
            cloudsall as cloud_sall,
            syscountry as country_id,
            cast(TIMESTAMP_SECONDS(syssunrise)as time) as sunrise_time,
            cast(TIMESTAMP_SECONDS(syssunset)as time) as sunset_time,
            rain1h,
            systype,
            sysid

        from {{ source("weather_source", "weather_api_extract") }}
    )
select *
from final
order by date_stamp asc, time_stamp asc