SELECT 
    row_number() OVER () AS location_dim_id,
    location_type, incident_zip,
    incident_address,
    street_name,
    cross_street_1,
    cross_street_2,
    address_type,
    city
FROM `bigquery-public-data.new_york_311.311_service_requests`
WHERE complaint_type IN ('Noise')

