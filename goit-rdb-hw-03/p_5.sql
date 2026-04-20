SELECT 
    supplier_id,
    COUNT(*) AS products_count,
    AVG(price) AS avg_price
FROM products
GROUP BY supplier_id;