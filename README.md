# NYC 311 Service Request Analysis Project

## Data Source and Provenance

* **Source**: [NYC Open Data 311 Service Requests](https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2020-to-Present/erm2-nwe9/)
* **Time period**: Jan 29–Mar 21, 2026 (Q1 2026)
* **Prep**: Instructor-generated random sample of 200k complaints from 15 agencies
* **Files**:

  * `raw/complaints.csv` (200k rows, main requests table)
  * `raw/agencies.csv` (unique agencies lookup table)
* **S3 paths**:

  * `s3://cmse492-chaud114-nyc311-704788404995-us-east-1-an/raw/complaints.csv`
  * `s3://cmse492-chaud114-nyc311-704788404995-us-east-1-an/raw/agencies.csv`

## Project Structure

```
aws-nyc311-chaud114/
├── README.md
├── DATA_DICTIONARY.md
├── raw/
│   ├── complaints.csv
│   └── agencies.csv
├── sql/
├── notes/
└── reports/
```

## Data Summary

See `DATA_DICTIONARY.md` for full schema.

**Key relationships**:
Join `complaints.agency = agencies.agency`

**Stakeholder question**:
An operations lead wants to understand which regions have higher call volume and when those spikes happen, so they can plan staffing more effectively.

This project analyzes NYC 311 service request data to identify patterns in complaint volume across boroughs and over time. The goal is to find high-demand regions and peak times to support better staffing decisions.

## Assumptions and Known Issues

* Empty `closed_date` means the request is still open or unresolved
* Some `incident_zip` values are missing or set to 0
* Date fields are stored as strings and need to be converted for analysis
* Data only covers part of Q1 2026, so trends may not reflect the full year
* Each row represents one service request (no duplicates assumed)
* No data on call duration, so volume does not exactly equal workload