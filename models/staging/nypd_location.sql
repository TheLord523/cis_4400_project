SELECT 
    row_number() OVER () AS location_dim_id,
    ADDR_PCT_CD AS precinct_address, 
    BORO_NM AS boro_name,
    LOC_OF_OCCUR_DESC AS location_of_occurrence,
    PATROL_BORO AS patrol_name,
    PREM_TYP_DESC AS premises_type,
FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2018`
UNION ALL
SELECT row_number() OVER () AS location_dim_id,
    ADDR_PCT_CD AS precinct_address, 
    BORO_NM AS boro_name,
    LOC_OF_OCCUR_DESC AS location_of_occurrence,
    PATROL_BORO AS patrol_name,
    PREM_TYP_DESC AS premises_type,
FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2019`
UNION ALL
SELECT row_number() OVER () AS location_dim_id,
    ADDR_PCT_CD AS precinct_address, 
    BORO_NM AS boro_name,
    LOC_OF_OCCUR_DESC AS location_of_occurrence,
    PATROL_BORO AS patrol_name,
    PREM_TYP_DESC AS premises_type,
FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2020`
UNION ALL
SELECT row_number() OVER () AS location_dim_id,
    ADDR_PCT_CD AS precinct_address, 
    BORO_NM AS boro_name,
    LOC_OF_OCCUR_DESC AS location_of_occurrence,
    PATROL_BORO AS patrol_name,
    PREM_TYP_DESC AS premises_type,
FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2021`