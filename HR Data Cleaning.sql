SELECT *
FROM portfolio_project.human_resources
;

-- Data preparation --
# Updating the data types accordingly and formatting dates

ALTER TABLE human_resources
MODIFY COLUMN id VARCHAR (20);

UPDATE human_resources
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
ALTER TABLE human_resources
MODIFY COLUMN birthdate DATE
;

UPDATE human_resources
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
ALTER TABLE human_resources
MODIFY COLUMN hire_date DATE
;

SELECT termdate FROM human_resources;
UPDATE human_resources
SET termdate = date(str_to_date(termdate, '%Y-%m-%d'))
WHERE termdate IS NOT NULL AND termdate != ''
;
ALTER TABLE human_resources
MODIFY COLUMN termdate DATE
;

-- Creation of age and seniority columns --

ALTER TABLE human_resources
ADD COLUMN age INT
;
UPDATE human_resources
SET age = timestampdiff(YEAR, birthdate, CURDATE())
;

ALTER TABLE human_resources
ADD COLUMN seniority int
;
UPDATE human_resources
SET seniority = timestampdiff(YEAR, hire_date, CURDATE())
;

-- By sorting the age column in ascendent order I realized that there is wrong data since the minimum age is -45 --

SELECT count(*) 
FROM human_resources
WHERE age < 18
;

