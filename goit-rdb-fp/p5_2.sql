DELIMITER //

DROP FUNCTION IF EXISTS CalculateYearsDiff //

CREATE FUNCTION CalculateYearsDiff(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(
        YEAR,
        MAKEDATE(input_year, 1),
        CURDATE()
    );
END //

DELIMITER ;

SELECT 
    Year,
    CalculateYearsDiff(Year) AS years_diff
FROM pandemic.infectious_cases_normalized
WHERE Year IS NOT NULL;
