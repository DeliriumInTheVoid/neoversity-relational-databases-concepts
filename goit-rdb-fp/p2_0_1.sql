SELECT COUNT(*) AS invalid_years_count
FROM infectious_cases_normalized
WHERE Year < 1901 OR Year > 2155;