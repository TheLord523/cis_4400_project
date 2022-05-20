{{config(
    materealized ="table"
)}}

WITH location_table AS(
    SELECT * FROM {{ref('Location_Dimension')}}
),
date_table AS (
    SELECT *
    FROM {{ref('date')}}
),
agency_table AS (
    SELECT * 
    FROM {{ref('Agency_Dimension')}}
),
crime_table AS (
    SELECT *
    FROM {{ref('Crime_Dimension')}}
),
from_date_table AS(
    SELECT ROW_NUMBER() OVER() as from_date_dim_id, CMPLNT_TO_TM, cmplnt_num
    FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2019`
    WHERE CMPLNT_FR_DT IS NOT NULL
),
to_date_table AS(
    SELECT ROW_NUMBER() OVER() as to_date_dim_id, CMPLNT_TO_TM
    FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2019`
    WHERE CMPLNT_TO_TM IS NOT NULL
),
time_table AS (
    SELECT ROW_NUMBER() OVER() as time_dim_id
    FROM {{ref('time')}}
),
total_table AS(
    SELECT * FROM location_table,
    date_table,
    agency_table,
    crime_table,
    from_date_table,
    to_date_table,
    time_table
)
SELECT location_dim_id,
date_dim_id,
agency_dim_id,
crime_dim_id,
cmplnt_num AS complaint_number,
from_date_dim_id,
to_date_dim_id,
time_dim_id,
FROM total_table