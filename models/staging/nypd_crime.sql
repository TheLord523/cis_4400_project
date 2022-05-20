SELECT 
    row_number() OVER () AS crime_dim_id,
    law_cat_cd as level_of_offense,
    ky_cd as offense_code,
    pd_cd as internal_classification_code,
    pd_desc as descriptor,
    ofns_desc as offense_description
FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2020`