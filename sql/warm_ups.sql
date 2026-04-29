-- This query counts the total number of complaints in the dataset.
-- Expected result: about 200,000 rows.

SELECT COUNT(*) AS n_complaints
FROM nyc311_db.complaints;


-- This query shows the date range of the dataset.
-- Expected result: earliest and latest request dates in Q1 2026.

SELECT 
  MIN(created_date) AS earliest,
  MAX(created_date) AS latest
FROM nyc311_db.complaints;


-- This query shows the top 10 agencies by number of complaints.
-- Expected result: agencies like NYPD, DSNY, etc. with highest volume first.

SELECT agency, COUNT(*) AS n
FROM nyc311_db.complaints
GROUP BY agency
ORDER BY n DESC
LIMIT 10;


-- This query shows top complaint types within each borough.
-- Expected result: most common issues per region (noise, garbage, etc.)

SELECT borough, problem, COUNT(*) AS n
FROM nyc311_db.complaints
GROUP BY borough, problem
ORDER BY n DESC
LIMIT 20;


-- This query joins complaints with agency names.
-- Expected result: agency codes matched with readable agency names + counts.

SELECT 
  c.agency,
  a.agency_name,
  COUNT(*) AS n
FROM nyc311_db.complaints AS c
JOIN nyc311_db.agencies AS a
  ON c.agency = a.agency
GROUP BY c.agency, a.agency_name
ORDER BY n DESC;