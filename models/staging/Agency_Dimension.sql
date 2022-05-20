{{config (
    materialized ="table"
)}}

SELECT * 
FROM {{ref('agency')}}
UNION ALL
SELECT *
from {{ref('nypd_agency')}}