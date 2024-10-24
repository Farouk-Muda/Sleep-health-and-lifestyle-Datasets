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

The primary dataset used for this analysis is "[Sleep_health_and_lifestyle_dataset.csv](https://www.kaggle.com/datasets/dnganhho/sleep-health)" file from Kaggle. The dataset contains 374 rows (individuals) and 8 columns (variables).

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
The dataset was cleaned with Excel and imported into the SAS environment using the code above.You can view the entire dataset in SAS using the link below.  
[Datasets PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/datasets.pdf)


```
/* List variable names to verify the correct names in the dataset */
PROC CONTENTS DATA=health.sleep_health;
RUN;
```
The SAS CONTENTS procedure provides an overview of the HEALTH.SLEEP_HEALTH dataset. The data type variable has an associated length, format, and informat:
Numeric Variables: Age, Daily_Steps, Diastolic_BP, Heart_Rate, Person_ID, Physical_Activity_Level, Quality_of_Sleep, Sleep_Duration, Stress_Level, Systolic_BP are all numeric variables with a length of 8 bytes and a format of BEST12. or BEST32..
Character Variables: Gender (6 bytes), BMI_Category (13 bytes), Occupation (20 bytes), Sleep_Disorder (11 bytes) are character variables with different lengths and $ formats.

[Contents PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Contents.pdf)

```
/* Summary statistics for numerical variables */
PROC MEANS DATA=health.sleep_health N MEAN STD MIN MAX;
    VAR Age Sleep_Duration Quality_of_Sleep Physical_Activity_Level Stress_Level 
        Systolic_BP Diastolic_BP Heart_Rate Daily_Steps;
RUN;
```
The SAS MEANS procedure provides a summary of key statistical metrics for several health-related variables in the HEALTH.SLEEP_HEALTH dataset. 
- The average age of participants is 42, suggesting that the dataset includes a middle-aged demographic, with a moderate range of ages.
- participants report getting about 7 hours of sleep, which aligns with general sleep recommendations. The relatively small standard deviation indicates that most individuals are close to the average sleep duration.
- The average quality of sleep is fairly good (7.31), but the range indicates that some participants may experience poor sleep quality.
- The mean indicates a moderate level of physical activity, although the wide range suggests variability in activity levels among participants.
- An average stress level of 5.39 indicates a moderate level of stress among participants, with some experiencing low stress and others at higher levels.
- The average systolic BP is within a generally acceptable range, but it highlights the need for monitoring, especially for those at the higher end.
- The average diastolic BP is also within a normal range, although individuals on the higher end may require further evaluation.
- The average heart rate indicates a normal resting rate, with minimal variability among participants.
-  The average number of daily steps is below the recommended 10,000 steps for optimal health, suggesting an opportunity for increased physical activity among participants.

[Numerical Variable PDF](https://github.com/Farouk-Muda/Sleep-health-and-lifestyle-Datasets/blob/main/RESULTS/Numerical%20variables.pdf)

```
/* Frequency counts for categorical variables */
PROC FREQ DATA=health.sleep_health;
    TABLES Gender Occupation BMI_Category Sleep_Disorder;
RUN;
```
**Gender Distribution**
- The gender distribution is nearly equal, with a slight male majority. This balance is important for generalizing findings across both genders in health analyses.
- The most common occupations include Doctor (18.98%) and Nurse (19.52%), indicating a strong representation of healthcare professionals, which may influence health outcomes and perceptions related to sleep and well-being.

**Occupational Distribution**
- Engineer (16.84%) and Lawyer (12.57%) also contribute significantly to the dataset.
- Manager and other roles show a low representation, suggesting a predominance of health-related professions.

**BMI Categories**
- The majority of participants fall into the Normal BMI category, followed by a significant portion classified as Overweight.
- The low percentage of Obese participants may suggest a generally healthy population but could also indicate potential health concerns related to weight management.

**Sleep Disorder Frequencies**
- A substantial majority report no sleep disorders (58.56%), while Insomnia and Sleep Apnea are reported by approximately equal portions of participants. The prevalence of insomnia and sleep apnea could suggest further investigation or intervention regarding sleep health.

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
