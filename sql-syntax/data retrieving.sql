-- Store current cumulative vaccination using CTE
WITH c_vaccine
AS (
  SELECT 
  MAX(cumulative_vaccine_doses_administered) AS max_c_vaccine, 
  country_name
  FROM `bigquery-public-data.covid19_open_data.covid19_open_data`
  GROUP BY 
    country_name
)

SELECT 
-- Avoid duplicate countries
  DISTINCT t.country_name,
  human_development_index, 
  c_vaccine.max_c_vaccine,
  -- population_urban + population_rural = total domestic population
  -- round the number to 4 digits after the comma
  ROUND((c_vaccine.max_c_vaccine/(population_urban + population_rural)), 4) AS rate_of_vaccination
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
ORDER BY 
  t.country_name
LIMIT 1000
