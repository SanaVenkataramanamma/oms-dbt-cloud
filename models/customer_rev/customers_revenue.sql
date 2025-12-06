select
    o.CUSTOMERID,
    c.customername,
    sum(o.orders_count) as orderscount ,
    sum(o.revenue) as Revenue
from {{ ref('orders_fact') }} as o
join {{ ref('customers_stg') }} as c on o.CUSTOMERID=c.CUSTOMERID
group by 1,2