SELECT COUNT(*) AS total_rows
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
RIGHT JOIN shippers sh ON o.shipper_id = sh.id
LEFT JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
LEFT JOIN suppliers s ON p.supplier_id = s.id;