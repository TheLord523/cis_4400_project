SELECT 
    row_number() OVER () AS location_dim_id,
    precinct_address, boro_name,
    location_of_occurrence,
    patrol_name,
    premises_type,
FROM `bigquery-public-data.new_york.nypd-complaint-data-current-year-to-date`