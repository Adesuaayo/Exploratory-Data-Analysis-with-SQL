-- We first need to create a database for our dataset
CREATE DATABASE hospital_er;
------------------------------------------------------------
------------------------------------------------------------
-- Selecting the database to use.
USE hospital_er;
------------------------------------------------------------
------------------------------------------------------------
-- Let's see the overview  of our dataset
SELECT *
FROM hospital_er
LIMIT 10;

------------------------------------------------------------
-- EXPLORATORY DATA ANALYSIS
------------------------------------------------------------
-- How many rows do we have in our dataset?
SELECT COUNT(*) AS num_rows
FROM hospital_er;

-- How many columns do we have in our dataset?
SELECT COUNT(*) AS num_cols 
FROM information_schema.columns 
WHERE table_name = 'hospital_er';

------------------------------------------------------------
------------------------------------------------------------
-- How many years of data do we have and percentage per year?
SELECT YEAR(date) AS years, COUNT(*) AS counts, ROUND((COUNT(*) / 
(SELECT COUNT(*) FROM hospital_er)) * 100, 1) AS pct
FROM hospital_er
GROUP BY YEAR(date);


-- What day of the week has the highest number of patient visits?
SELECT dayname(date) AS visit_day,
	   COUNT(*) AS number_of_visits
FROM hospital_er
GROUP BY visit_day
ORDER BY number_of_visits DESC;




-- What time of the day do we have the most patient visits
SELECT HOUR(date) AS hour_of_day, COUNT(*) AS number_of_visits
FROM hospital_er
GROUP BY hour_of_day
ORDER BY number_of_visits DESC;



------------------------------------------------------------
------------------------------------------------------------

-- What are the unique values in our patient gender
SELECT DISTINCT patient_gender
FROM hospital_er;

-- What is the distribution of our pateint gender
SELECT patient_gender, COUNT(*) AS counts, ROUND((COUNT(*) / 
(SELECT COUNT(*) FROM hospital_er)) * 100, 1) AS pct
FROM hospital_er
GROUP BY patient_gender;

-- What is the average age of patients in our data set
SELECT ROUND(AVG(patient_age)) AS average_age
FROM hospital_er;

-- How many race do we have in our dataset
SELECT DISTINCT patient_race
FROM hospital_er;

-- What is the distribution of races in our dataset
SELECT patient_race, COUNT(*) AS counts, ROUND((COUNT(*) / 
(SELECT COUNT(*) FROM hospital_er)) * 100, 1) AS pct
FROM hospital_er
GROUP BY patient_race
ORDER BY pct DESC;

-- What is the average waiting time of patients in our data set?
SELECT AVG(patient_waittime) AS average_waitting_time
FROM hospital_er;

-- What is the maximum waiting time of our patient
SELECT MAX(patient_waittime)
FROM hospital_er;

-- What is the minimum waiting time of our patient
SELECT MIN(patient_waittime)
FROM hospital_er;

-- How is our patients distributed across departemnt_referral 
SELECT department_referral, COUNT(*) AS counts, ROUND((COUNT(*) / 
(SELECT COUNT(*) FROM hospital_er)) * 100, 1) AS pct
FROM hospital_er
GROUP BY department_referral
ORDER BY counts DESC;