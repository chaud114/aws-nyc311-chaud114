-- This query calculates average resolution time (in days) by agency.
-- Issue with original query: it failed because some closed_date values are NULL
-- and date parsing was unnecessary since fields are already usable strings.

SELECT
  agency,
  AVG(
    date_diff(
      'day',
      CAST(created_date AS TIMESTAMP),
      CAST(closed_date AS TIMESTAMP)
    )
  ) AS avg_days_to_close
FROM nyc311_db.complaints
WHERE closed_date IS NOT NULL
GROUP BY agency
ORDER BY avg_days_to_close DESC;