{{config(
    materialized = "table"
)}}
WITH integrated AS(
    SELECT *
    FROM {{ref('location')}} 
    LEFT JOIN {{ref('nypd_location')}} ON (location.location_dim_id = nypd_location.location_dim_id)
)

SELECT DISTINCT *
FROM integrated