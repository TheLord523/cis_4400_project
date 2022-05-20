SELECT 
    row_number() OVER () AS complaint_type_dim_id,
    complaint_type, 
    descriptor,
    status
FROM  
   ( SELECT DISTINCT complaint_type, status, descriptor
     FROM `bigquery-public-data.new_york_311.311_service_requests`
     WHERE complaint_type IN ('Noise')
    )
