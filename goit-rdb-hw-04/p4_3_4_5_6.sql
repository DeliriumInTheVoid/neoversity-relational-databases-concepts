SELECT 
    cat.name AS category_name, 
    COUNT(*) AS row_count, 
    AVG(od.quantity) AS average_quantity
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN suppliers s ON p.supplier_id = s.id
--  тільки ті рядки, де employee_id > 3 та ≤ 10
WHERE o.employee_id > 3 AND o.employee_id <= 10
-- згрупуйте за іменем категорії
GROUP BY cat.name
-- рядки, де середня кількість товару більша за 21
HAVING AVG(od.quantity) > 21
-- рядки за спаданням кількості рядків
ORDER BY row_count DESC
-- чотири рядки з пропущеним першим рядком
LIMIT 4 OFFSET 1;