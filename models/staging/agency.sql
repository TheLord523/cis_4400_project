SELECT 
    row_number() OVER () AS agency_dim_id,
    agency, agency_name
FROM  
   ( SELECT DISTINCT agency, agency_name
     FROM `bigquery-public-data.new_york_311.311_service_requests`
     WHERE complaint_type IN ('Noise')
    )
