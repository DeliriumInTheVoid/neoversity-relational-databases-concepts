SELECT 
    Year,
    MAKEDATE(Year, 1) AS year_start_date,
    CURDATE() AS today_date,
    TIMESTAMPDIFF(YEAR, MAKEDATE(Year, 1), CURDATE()) AS years_diff
FROM pandemic.infectious_cases_normalized
WHERE Year IS NOT NULL
