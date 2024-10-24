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

```
/* Import the cleaned dataset */
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


```
/* List variable names to verify the correct names in the dataset */
PROC CONTENTS DATA=health.sleep_health;
RUN;
```  
[Contents PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Contents.pdf)

```
/* Summary statistics for numerical variables */
PROC MEANS DATA=health.sleep_health N MEAN STD MIN MAX;
    VAR Age Sleep_Duration Quality_of_Sleep Physical_Activity_Level Stress_Level 
        Systolic_BP Diastolic_BP Heart_Rate Daily_Steps;
RUN;
```  
[Numerical Variable PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Numerical%20variables.pdf)

```
/* Frequency counts for categorical variables */
PROC FREQ DATA=health.sleep_health;
    TABLES Gender Occupation BMI_Category Sleep_Disorder;
RUN;
```  
[Categorical Variable PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Categorical%20variables.pdf)

```
/* Correlation analysis between key variables */
PROC CORR DATA=health.sleep_health;
    VAR Sleep_Duration Quality_of_Sleep Physical_Activity_Level Stress_Level Heart_Rate Daily_Steps;
RUN;
```
[Correlation Analysis PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/correlation%20analysis.pdf)

```
/* Visualize the distribution of sleep duration by occupation */
PROC SGPLOT DATA=health.sleep_health;
    VBOX Sleep_Duration / CATEGORY=Occupation;
    TITLE 'Sleep Duration by Occupation';
RUN;
```  
[Distribution of Sleep duration by Occupation PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Visualise%20sleep%20duration%20by%20occupation.pdf)

```
/* Distribution of stress level across different BMI categories */
PROC SGPLOT DATA=health.sleep_health;
    VBOX Stress_Level / CATEGORY=BMI_Category;
    TITLE 'Stress Level by BMI Category';
RUN;
```
[Stress Level by BMI Category PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Stress%20Level%20by%20BMI%20Category.pdf) 

```
/* T-Test to compare sleep duration between genders */
PROC TTEST DATA=health.sleep_health;
    CLASS Gender;
    VAR Sleep_Duration;
RUN;
```
[Sleep duration between Genders PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/sleep%20duration%20between%20genders.pdf) 

```
/* One-way ANOVA to compare sleep duration by occupation */
PROC ANOVA DATA=health.sleep_health;
    CLASS Occupation;
    MODEL Sleep_Duration = Occupation;
    MEANS Occupation / TUKEY;
RUN;
```
[ANOVA Sleep Duration by Occupation PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/compare%20sleep%20duration%20by%20occupation.pdf) 

```
/* Multiple regression analysis predicting sleep duration */
PROC GLM DATA=health.sleep_health;
    CLASS Gender BMI_Category;  /* Categorical variables */
    MODEL Sleep_Duration = Age Gender Quality_of_Sleep Physical_Activity_Level Stress_Level
                           Systolic_BP Diastolic_BP Heart_Rate Daily_Steps BMI_Category;
RUN;
```
[Contents PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/predicting%20sleep%20duration.pdf) 
