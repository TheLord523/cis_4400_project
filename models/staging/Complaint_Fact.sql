{{config(
    materalized="table"
)}}
 
WITH complaint_table AS (
    SELECT * FROM {{ref('Complaint_Type')}}
),
agency_table AS (
    SELECT * FROM {{ref('Agency_Dimension')}}
),
location_table AS (
    SELECT * FROM {{ref('Location_Dimension')}}
),
date_table AS (
    SELECT * FROM {{ref('date')}}
),
crime_table AS (
    SELECT * FROM {{ref('Crime_Dimension')}}
),
created_date_table AS(
    SELECT ROW_NUMBER() OVER() AS created_date_dim_id,
    FROM `bigquery-public-data.new_york_311.311_service_requests`
    WHERE complaint_type IN ('Noise')
),
closed_date_table AS (
   SELECT ROW_NUMBER() OVER() AS closed_date_dim_id, unique_key
    FROM `bigquery-public-data.new_york_311.311_service_requests`
    WHERE complaint_type IN ('Noise')
),
total_table AS (
    SELECT * FROM complaint_table, agency_table,
    location_table, date_table, crime_table, created_date_table, closed_date_table
)
SELECT agency_dim_id, 
location_dim_id,
date_dim_id,
complaint_type_dim_id,
created_date_dim_id,
closed_date_dim_id,
crime_dim_id,
unique_key
FROM total_table
