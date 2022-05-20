{{config(
    materialized = "table"
)}}

SELECT *
FROM {{ref('nypd_crime')}}