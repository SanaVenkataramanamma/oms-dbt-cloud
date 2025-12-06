{{
    config(
        materialized='table'
    )
}}
select 
    ORDERID,
    ORDERDATE,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    STATUS as statusCD,
    CASE 
        WHEN STATUS='01' then 'In progress'
        when STATUS='02' then 'completed'
        when STATUS='03' then 'canceled'
        else null
    end as statusdesc,
    case 
        when STOREID=1 then 'online'
        else 'in-store'
    end as order_channel,
    UPDATED_AT,
    current_timestamp() as dbt_updated_at
from 
{{ source('landing', 'orders') }}
