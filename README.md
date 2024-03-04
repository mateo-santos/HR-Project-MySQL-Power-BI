# HR-Project-MySQL-Power-BI
This is a simple project where I used a HR Employees dataset to showcase data cleaning, data preparation and data visualization skills.

![image](https://github.com/mateo-santos/HR-Project-MySQL-Power-BI/assets/161756142/e6f98ff3-ea40-4ea6-ac3b-01e68dbc7980)
![image](https://github.com/mateo-santos/HR-Project-MySQL-Power-BI/assets/161756142/d242c821-5f12-4fdc-9e3e-078aba557bdd)

## Data Used
**Dataset** - HR Data with +22000 rows from the year 2000 to 2020.
**Data Cleaning and Analysis** - MySQL
**Data Visualization** - Power BI

## Questions
1. What is the gender breakdown of employees in the company?
2. What is the race/etnicity breakdown of employees in the company?
3. What is the age distribution of employees in the compnay?
4. How many employees work at headquarters vs remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by city and state?
10. How has the company's employee count changed over the time based on hire and term dates?
11. What is the tenure distribution for each department?

## Findings
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- The age distribution shows that 56,8% of the employees belong to age groups [30-40] and [40-50], meaning the company has a high seniority level. Younger employees (below 30 years-old) represent 26%.
- Most of employees work from the headquarters, only a 25% work remotly.
- The average length of employment for terminated employees is around 8 years.
- The Marketing department has the highest turnover rate followed by Training. The least turn over rate are in the Research and development, Support and Legal departments.
- A large number of employees come from the state of Ohio.
- The net change in employees has increased over the years.

## Observations
-  Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.
-  Some termdates were far into the future and were not included in the analysis (1599 records). The only term dates used were those less than or equal to the current date.
