SELECT 
    row_number() OVER () AS agency_dim_id,
    jurisdiction_code
FROM  
   ( SELECT DISTINCT jurisdiction_code
     FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2018`
    UNION ALL
    SELECT DISTINCT jurisdiction_code
    FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2019`
    UNION ALL
    SELECT DISTINCT jurisdiction_code
    FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2020`
    UNION ALL
    SELECT DISTINCT jurisdiction_code
    FROM `handy-bonbon-142723.nypd_complaints.nypd_complaints_2021`
    )
