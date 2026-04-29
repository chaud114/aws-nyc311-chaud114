-- Stakeholder question:
-- Which borough has the highest overall complaint volume?
-- Expected result: ranking of boroughs by total requests (used for staffing decisions)

SELECT borough, COUNT(*) AS total_complaints
FROM nyc311_db.complaints
GROUP BY borough
ORDER BY total_complaints DESC;