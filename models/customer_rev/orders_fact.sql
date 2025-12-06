select 
    o.ORDERID,
    o.ORDERDATE,
    o.CUSTOMERID,
    o.EMPLOYEEID,
    o.STOREID,
    o.statusCD,
    count(distinct o.ORDERID) as orders_count,
    sum(oi.TotalPrice) as revenue,
    o.UPDATED_AT
    
from 
   {{ ref('order_stg') }} o
join
    {{ ref('orderitems_stg') }} oi

on o.ORDERID=oi.ORDERID
group by 1,2,3,4,5,6,9