with cte as (
    select distinct
      to_timestamp(started_at) started_at
     ,date(started_at) date_started_at
     ,hour(to_timestamp(started_at)) hour_started_At
     ,case when dayname(to_timestamp(started_at)) in ('Sun', 'Sat') then 'WEEKEND'
        else 'BUSINESSDAY' END AS DAY_TYPE
     ,MONTH(to_timestamp(started_at))
    from
     {{ source('demo', 'bike') }}
    where 
     started_at != 'started_at'
)

select * from cte