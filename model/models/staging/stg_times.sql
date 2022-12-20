--list the time to convert
with time_source as(
    select distinct time_stamp,
    case when cast(time_stamp as string) >= '12' then 'pm'
    else 'am'
    end as time_type
    from {{ ref('raw_data_weather') }}
)

,final as(
    select * from time_source
    order by time_stamp asc
)
select * from final