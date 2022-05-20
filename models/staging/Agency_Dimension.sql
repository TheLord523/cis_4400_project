{{config (
    materialized ="table"
)}}

with integrated AS (
SELECT *
FROM {{ref('nypd_agency')}}
LEFT JOIN {{ref('agency')}} USING (agency_dim_id)
)

SELECT agency_dim_id, agency, agency_name
FROM integrated