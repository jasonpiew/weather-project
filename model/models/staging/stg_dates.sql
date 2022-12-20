--storing the data information
with date_source as(
    select distinct date_stamp,
    extract(month from date_stamp) as month_value,
    extract(year from date_stamp) as year_value,
    extract(week from date_stamp) as week_value
    from {{ ref('raw_data_weather') }} 
)
,final as(
    select * 
    from date_source
    order by date_stamp asc
)
select * from final