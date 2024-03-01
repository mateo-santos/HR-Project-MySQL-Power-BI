-- QUESTIONS --

-- 1. What is the gender breakdown of employees in the company?

SELECT gender, count(*) AS gender_count
FROM human_resources
WHERE age >= 18 AND termdate IS NULL #Employees with NULL termdates are currently working for the company
GROUP BY gender
;

-- 2. What is the race/etnicity breakdown of employees in the company?

ALTER TABLE human_resources
RENAME COLUMN race TO etnicity
;
SELECT etnicity, count(*) AS etnicity_count
FROM human_resources
WHERE age >= 18 AND termdate IS NULL #Employees with NULL termdates are currently working for the company
GROUP BY etnicity
ORDER BY etnicity_count desc
;

-- 3. What is the age distribution of employees in the compnay?

SELECT 
	CASE
		WHEN age >= 18 AND age <= 25 THEN '18-25'
        WHEN age >= 26 AND age <= 30 THEN '26-30'
        WHEN age >= 31 AND age <= 40 THEN '31-40'
        WHEN age >= 40 AND age <= 50 THEN '40-50'
        WHEN age >= 50 AND age <= 60 THEN '50-60'
		ELSE '60+'
	END AS age_group, gender,
    count(*) AS group_count
FROM human_resources
WHERE age >= 18 AND termdate IS NULL #Employees with NULL termdates are currently working for the company
GROUP BY gender, age_group
ORDER BY age_group
;

-- 4. How many employees work at headquarters vs remote locations?

SELECT location, count(*) AS location_count
FROM human_resources
WHERE age >= 18 AND termdate IS NULL #Employees with NULL termdates are currently working for the company
GROUP BY location
;

-- 5. What is the average length of employment for employees who have been terminated?

SELECT 
	avg(datediff(termdate, hire_date))/365 AS avg_employment_length
FROM human_resources
WHERE termdate <= curdate()
;

-- 6. How does the gender distribution vary across departments and job titles?

SELECT department, gender, 
	count(*) AS employees_per_department
FROM human_resources
WHERE age >= 18 AND termdate IS NULL
GROUP BY department, gender
ORDER BY department
;
SELECT jobtitle, gender, 
	count(*) AS employees_per_jobtitle
FROM human_resources
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle, gender
ORDER BY jobtitle
;

-- 7. What is the distribution of job titles across the company?

SELECT jobtitle, 
	count(*) AS jobtitle_distribution
FROM human_resources
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle
ORDER BY jobtitle_distribution desc
;

-- 8. Which department has the highest turnover rate?
# Use of subquery

SELECT department, 
	total_count,
    terminated_count,
    terminated_count/total_count AS turnover_rate
FROM (
	SELECT department,
    count(*) AS total_count,
    SUM(CASE
		WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1
        ELSE 0
        END) AS terminated_count
	FROM human_resources
	WHERE age >= 18
	GROUP BY department
    ) AS subquery
ORDER BY turnover_rate desc
;

-- 9. What is the distribution of employees across locations by city and state?

SELECT state,
	    count(*) AS distribution
FROM human_resources
WHERE age >= 18 AND termdate IS NULL
GROUP BY state
ORDER BY distribution desc
;

-- 10. How has the company's employee count changed over the time based on hire and term dates?

SELECT
	year, 
    hires,
    terminations,
    hires - terminations AS net_change,
    ((hires - terminations)/hires) * 100 AS net_change_percentage
FROM (
	SELECT 
		YEAR(hire_date) AS year,
		count(*) AS hires,
        SUM( CASE
        WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 
        ELSE 0
        END) AS terminations
	FROM human_resources
    WHERE age >= 18
    GROUP BY year) AS subquery
ORDER BY year 
;

-- 11. What is the tenure distribution for each department?

SELECT department, 
	round(avg(datediff(termdate, hire_date))/365, 2) AS avg_employment_length
FROM human_resources
WHERE termdate <= curdate() AND termdate IS NOT NULL AND age >= 18
GROUP BY department
;
