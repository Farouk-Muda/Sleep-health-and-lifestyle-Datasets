# Sleep-health-and-lifestyle-Datasets
I  used SAS for analysis of this datasets

## Table of Contents
- [Overview](#overview)
- [Data Sources](#data-sources)
- [Recommendations](#recommendations)

### Overview
---

This dataset is designed to provide insights into how various lifestyle factors and health metrics influence sleep health. It provides a comprehensive set of variables related to an individual’s daily habits, physical condition, and stress levels, aiming to explore the relationships between these factors and sleep duration, sleep quality, and overall well-being.

### Data Source

The primary dataset used for this analysis is "Sleep_health_and_lifestyle_dataset.csv" file from Kaggle. The dataset contains 374 rows (individuals) and 8 columns (variables).

### Data Cleaning/Preparation

In the initial data preparation phase, the following tasks were performed:
1. Data loading and inspection.
2. Handling missing values.
3. Data cleaning and formatting.

### Exploratory Data Analysis

```/* Import the cleaned dataset */
libname Health "/home/u63989960/sasuser.v94/Health";

PROC IMPORT DATAFILE='/home/u63989960/sasuser.v94/Health/Sleep.csv'
    OUT=health.sleep_health
    DBMS=CSV
    REPLACE;
    GETNAMES=YES;
RUN;
proc print data=health.sleep_health; run;
```   
[Datasets PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/datasets.pdf)


```/* List variable names to verify the correct names in the dataset */
PROC CONTENTS DATA=health.sleep_health;
RUN;
```  
[Contents PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Contents.pdf)



   

