{{config(
    materialized = "table"
)}}
WITH integrated AS(
    SELECT *
    FROM {{ref('location')}} 
    LEFT JOIN {{ref('nypd_location')}} ON (location.location_dim_id = nypd_location.location_dim_id)
)

SELECT DISTINCT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS location_dim_id
FROM integrated