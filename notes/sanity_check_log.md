## Query: Average resolution time by agency

- **File:** sql/resolution_time.sql  
- **Business question:** How long does each agency take to resolve complaints?  

- **What I expected:**  
  I expected most agencies to have similar resolution times, but agencies like NYPD or DSNY might take longer because they handle more complex or higher-volume issues.

- **Issues encountered:**  
  The original query failed because it tried to parse date strings incorrectly and did not handle missing `closed_date` values. Some complaints are still open, which caused errors in calculating time differences.

- **Checks performed:**  
  I checked for NULL values in `closed_date` and confirmed that some rows are still open. I also simplified the query by casting dates as timestamps instead of using `date_parse`, which fixed the formatting issue. I filtered out rows where `closed_date` is NULL to ensure valid comparisons.

- **Final outcome:**  
  The revised query runs successfully and produces reasonable results. Agencies now show different average resolution times, which makes sense given their different workloads and responsibilities. The results seem reliable for analysis.

- **Confidence:** High. Would present to stakeholder.