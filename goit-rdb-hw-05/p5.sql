DROP FUNCTION IF EXISTS divide_floats;

DELIMITER //

CREATE FUNCTION divide_floats(val1 FLOAT, val2 FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    IF val2 = 0 THEN
        RETURN NULL; 
    END IF;
    
    RETURN val1 / val2;
END //

DELIMITER ;

SELECT 
    id,
    order_id,
    product_id,
    quantity,
    ROUND(divide_floats(quantity, SUM(quantity) OVER()) * 100, 3) AS percentage_share
FROM order_details;
