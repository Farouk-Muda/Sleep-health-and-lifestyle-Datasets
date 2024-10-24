/* Import the cleaned dataset */
libname Health "/home/u63989960/sasuser.v94/Health";

PROC IMPORT DATAFILE='/home/u63989960/sasuser.v94/Health/Sleep.csv'
    OUT=health.sleep_health
    DBMS=CSV
    REPLACE;
    GETNAMES=YES;
RUN;
proc print data=health.sleep_health; run;


/* List variable names to verify the correct names in the dataset */
PROC CONTENTS DATA=health.sleep_health;
RUN;


/* Summary statistics for numerical variables */
PROC MEANS DATA=health.sleep_health N MEAN STD MIN MAX;
    VAR Age Sleep_Duration Quality_of_Sleep Physical_Activity_Level Stress_Level 
        Systolic_BP Diastolic_BP Heart_Rate Daily_Steps;
RUN;

/* Frequency counts for categorical variables */
PROC FREQ DATA=health.sleep_health;
    TABLES Gender Occupation BMI_Category Sleep_Disorder;
RUN;


/* Correlation analysis between key variables */
PROC CORR DATA=health.sleep_health;
    VAR Sleep_Duration Quality_of_Sleep Physical_Activity_Level Stress_Level Heart_Rate Daily_Steps;
RUN;

/* Visualize the distribution of sleep duration by occupation */
PROC SGPLOT DATA=health.sleep_health;
    VBOX Sleep_Duration / CATEGORY=Occupation;
    TITLE 'Sleep Duration by Occupation';
RUN;

/* Distribution of stress level across different BMI categories */
PROC SGPLOT DATA=health.sleep_health;
    VBOX Stress_Level / CATEGORY=BMI_Category;
    TITLE 'Stress Level by BMI Category';
RUN;


/* T-Test to compare sleep duration between genders */
PROC TTEST DATA=health.sleep_health;
    CLASS Gender;
    VAR Sleep_Duration;
RUN;

/* One-way ANOVA to compare sleep duration by occupation */
PROC ANOVA DATA=health.sleep_health;
    CLASS Occupation;
    MODEL Sleep_Duration = Occupation;
    MEANS Occupation / TUKEY;
RUN;

