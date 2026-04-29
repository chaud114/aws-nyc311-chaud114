# NYC 311 Modeling Plan

**Date created:** April 3, 2026

## Business question
Predict how long (in days) a 311 complaint will take to be resolved at the time it is filed.

## Data source
- **S3 path:** s3://your-bucket-name/modeling/resolution_time_modeling.csv
- **Records:** (173851, 8)
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

## Baseline Model Results

- **Model:** Linear Regression
- **Features used:** same numerical feature columns used in training (update with your feature_cols list)
- **Target:** days_to_close
- **Train/test split:** 80/20, random_state=42

### Metrics
- Mean Absolute Error (MAE): 1.84 days
- R² Score: 0.381

### Interpretation
The model’s predictions are off by about 1.84 days on average. The R² value of 0.381 means the model explains about 38% of the variation in resolution time, so it captures some patterns but is not very strong yet.

### Limitation
The model is simple and may miss important patterns in the data. It also assumes a linear relationship, which may not match real-world complaint resolution behavior. Missing values and noisy timestamps can also reduce performance.