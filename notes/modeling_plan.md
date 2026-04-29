# NYC 311 Modeling Plan

**Date created:** April 3, 2026

## Business question
Predict how long (in days) a 311 complaint will take to be resolved at the time it is filed.

## Data source
- **S3 path:** s3://your-bucket-name/modeling/resolution_time_modeling.csv
- **Records:** [put df.shape[0] here]
- **Athena query:** sql/athena_to_modeling.sql

## Features
- agency (string)
- borough (string)
- problem (string)
- incident_zip (string)
- day_of_week (numeric)
- hour_of_day (numeric)
- same_day_complaint_volume (numeric, count of similar complaints on same day)

## Target
- **Name:** days_to_close
- **Type:** Regression (continuous numeric value)
- **Distribution:** 
  - Min: 0.0
  - Max: 23.00
  - Mean: 13.006040

## Modeling approach
- **Baseline:** Linear regression (simple and interpretable)
- **Metrics:** RMSE (root mean squared error), MAE (mean absolute error)
- **Train/test split:** 80/20

## Data quality notes
- No missing values in target variable
- days_to_close is constrained between 0 and 365
- Possible skew if most complaints are resolved quickly
- Potential outliers if some complaints take much longer

## Next steps
- Perform train/test split
- Encode categorical variables (agency, borough, problem)
- Fit baseline linear regression model
- Evaluate model performance using RMSE and MAE
- Analyze feature importance and errors