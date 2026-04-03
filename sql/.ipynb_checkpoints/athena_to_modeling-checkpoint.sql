-- Athena query for model data generation (motivated by stakeholder question)

-- Stakeholder question:
-- Estimate how long a complaint will take to be resolved

-- Features:
-- agency: agency handling the complaint
-- borough: location of complaint
-- problem: type of complaint
-- incident_zip: zip code of complaint
-- day_of_week: day complaint was created
-- hour_of_day: hour complaint was created
-- same_day_complaint_volume: number of similar complaints on same day

-- Target:
-- days_to_close: number of days it takes to resolve the complaint

CREATE TABLE nyc311_db.resolution_time_modeling AS
SELECT
    agency,
    borough,
    problem,
    incident_zip,
    day_of_week(date_parse(created_date, '%Y-%m-%d %H:%i:%s')) AS day_of_week,
    hour(date_parse(created_date, '%Y-%m-%d %H:%i:%s')) AS hour_of_day,

    COUNT(*) OVER (
        PARTITION BY agency, problem,
        DATE(date_parse(created_date, '%Y-%m-%d %H:%i:%s'))
    ) AS same_day_complaint_volume,

    date_diff(
        'day',
        date_parse(created_date, '%Y-%m-%d %H:%i:%s'),
        date_parse(closed_date, '%Y-%m-%d %H:%i:%s')
    ) AS days_to_close

FROM nyc311_db.complaints

WHERE closed_date <> ''
  AND borough IN ('BROOKLYN','QUEENS','BRONX','MANHATTAN','STATEN ISLAND')
  AND date_diff(
        'day',
        date_parse(created_date, '%Y-%m-%d %H:%i:%s'),
        date_parse(closed_date, '%Y-%m-%d %H:%i:%s')
    ) BETWEEN 0 AND 365;