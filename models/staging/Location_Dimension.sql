{{config(
    materialized = "table"
)}}
WITH integrated AS(
    SELECT location.location_dim_id, location_type, incident_zip, incident_address, street_name, cross_street_1,
    cross_street_2, address_type, city, precinct_address, boro_name, location_of_occurrence,
    patrol_name,
    premises_type
    FROM {{ref('location')}} 
    LEFT JOIN {{ref('nypd_location')}} ON (location.location_dim_id = nypd_location.location_dim_id)
)

SELECT DISTINCT *
FROM integrated 