--list the unique countries description
with source_data as(
select distinct country_name,
longtitude,
lattitude,
country_id
from {{ ref('raw_data_weather') }}
)
,final as(
    select * from source_data
)
select * from final