SELECT
    ROW_NUMBER() OVER() as date_dim_id,
    d AS full_date,
    FORMAT_DATE('%A', d) AS weekday_name,
    EXTRACT(DAY FROM d) AS day_of_month,
    FORMAT_DATE('%B', d) as name_of_month,
    EXTRACT(YEAR FROM d) AS year,
(CASE WHEN FORMAT_DATE('%A', d) IN ('Sunday', 'Saturday')
THEN 0 ELSE 1 END) AS weekend_day,
FROM (
SELECT * FROM
UNNEST (GENERATE_DATE_ARRAY('2018-12-01', '2022-05-01', INTERVAL 1 DAY) ) AS d )