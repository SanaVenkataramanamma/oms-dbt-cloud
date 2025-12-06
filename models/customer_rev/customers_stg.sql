{{
    config(
        materialized='table'
    )
}}

select 
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE,
    UPDATED_AT,
    concat(FIRSTNAME,' ',LASTNAME) as customername
from 
    {{source('landing','customers')}}