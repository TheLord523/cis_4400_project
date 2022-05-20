{{config(
    materialized = "table"
)}}

SELECT *
FROM {{ref('complaint_type')}}