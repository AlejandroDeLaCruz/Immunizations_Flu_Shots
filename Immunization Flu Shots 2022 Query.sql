/*
Objectives
Come up with flu shots dashboard for 2022 that does the following

1.) Total % of patients getting flu shots stratified by 
	a.) Age
	b.) Race
	c.) County (on map)
	d.) Overall
	
2.) Running total of flu shots over the course of 2022
3.) Total number of flu shots given in 2022
4.) A list of Patients that show whether or not they received the flu shots

Requirements:

Patients must have been "Active at our hospital"
*/

WITH active_patients AS (
	SELECT
		DISTINCT patient
	FROM
		encounters AS e
	JOIN
		patients AS pat ON e.patient = pat.id
	WHERE
		EXTRACT(YEAR FROM start) BETWEEN 2020 AND 2022
		AND pat.deathdate IS NULL
		AND EXTRACT(EPOCH FROM AGE('2022-12-31', pat.birthdate))/2592000 >= 6),

flu_shot_ranks AS (
	SELECT
		patient,
		date,
		DENSE_RANK() OVER(PARTITION BY patient ORDER BY date) AS flu_date_rank
	FROM
		immunizations
	WHERE
		code = 5302
		AND EXTRACT(YEAR FROM date) = 2022),
	
flu_shot_2022 AS (
	SELECT
		patient,
		date AS earliest_flu_shot_2022
	FROM
		flu_shot_ranks
	WHERE
		flu_date_rank = 1)

SELECT
	pat.birthdate,
	pat.race,
	pat.county,
	pat.id,
	pat.first,
	pat.last,
	flu.earliest_flu_shot_2022,
	flu.patient,
	CASE
		WHEN flu.patient IS NOT NULL THEN 1
		ELSE 0
	END AS flu_shot_2022
FROM
	patients AS pat
LEFT JOIN
	flu_shot_2022 AS flu ON pat.id = flu.patient
WHERE
	1 = 1
	AND pat.id IN(SELECT patient FROM active_patients);