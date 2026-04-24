DELIMITER //

DROP FUNCTION IF EXISTS CalculateCasesPerPeriod //

CREATE FUNCTION CalculateCasesPerPeriod(
    yearly_cases DOUBLE, 
    divisor DOUBLE
) 
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE result DOUBLE;
    
    IF divisor = 0 THEN
        RETURN NULL;
    END IF;
    
    SET result = yearly_cases / divisor;
    
    RETURN result;
END //

DELIMITER ;

SELECT 
    e.Entity,
    ic.Year,
    ic.Number_rabies AS cases_per_year,
    CalculateCasesPerPeriod(ic.Number_rabies, 2) AS cases_per_half_year,
    CalculateCasesPerPeriod(ic.Number_rabies, 4) AS cases_per_quarter,
    CalculateCasesPerPeriod(ic.Number_rabies, 12) AS cases_per_month
FROM pandemic.infectious_cases_normalized ic
JOIN pandemic.entities e 
  ON ic.entity_id = e.id
WHERE ic.Number_rabies IS NOT NULL;
