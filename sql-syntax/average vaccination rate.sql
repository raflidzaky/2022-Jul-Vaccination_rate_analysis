-- Query average vaccination rate per HDI groups 
-- It'll be a bit redundant syntax, but it eases me to pull based on each conditions given
WITH c_vaccine
AS (
  SELECT 
  MAX(cumulative_vaccine_doses_administered) AS max_c_vaccine, 
  country_name,
  FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
  GROUP BY 
    country_name
)

-- HDI Below 0.550
SELECT 
ROUND(AVG(c_vaccine.max_c_vaccine/(population_urban + population_rural)),4) AS Average_Vaccination_Rate
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` t
JOIN c_vaccine
ON t.country_name = c_vaccine.country_name
WHERE 
  human_development_index IS NOT NULL
  AND
  population_rural IS NOT NULL
  AND
  population_urban IS NOT NULL
  AND
  cumulative_vaccine_doses_administered IS NOT NULL
  AND 
  human_development_index < 0.550 
LIMIT 1000; 


-- HDI Between 0.550 - 0.69
SELECT 
ROUND(AVG(c_vaccine.max_c_vaccine/(population_urban + population_rural)),4) AS Average_Vaccination_Rate
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` t
JOIN c_vaccine
ON t.country_name = c_vaccine.country_name
WHERE 
  human_development_index IS NOT NULL
  AND
  population_rural IS NOT NULL
  AND
  population_urban IS NOT NULL
  AND
  cumulative_vaccine_doses_administered IS NOT NULL
  AND 
  human_development_index BETWEEN 0.550 AND 0.69
LIMIT 1000; 

-- HDI Between 0.7-0.79
SELECT 
ROUND(AVG(c_vaccine.max_c_vaccine/(population_urban + population_rural)),4) AS Average_Vaccination_Rate
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` t
JOIN c_vaccine
ON t.country_name = c_vaccine.country_name
WHERE 
  human_development_index IS NOT NULL
  AND
  population_rural IS NOT NULL
  AND
  population_urban IS NOT NULL
  AND
  cumulative_vaccine_doses_administered IS NOT NULL
  AND 
  human_development_index BETWEEN 0.7 AND 0.79
LIMIT 1000; 

-- HDI Between 0.8 - 1.0
SELECT 
ROUND(AVG(c_vaccine.max_c_vaccine/(population_urban + population_rural)),4) AS Average_Vaccination_Rate
FROM `bigquery-public-data.covid19_open_data.covid19_open_data` t
JOIN c_vaccine
ON t.country_name = c_vaccine.country_name
WHERE 
  human_development_index IS NOT NULL
  AND
  population_rural IS NOT NULL
  AND
  population_urban IS NOT NULL
  AND
  cumulative_vaccine_doses_administered IS NOT NULL
  AND 
  human_development_index BETWEEN 0.8 AND 1.0
LIMIT 1000; 
