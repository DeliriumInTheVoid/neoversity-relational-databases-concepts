SELECT
    COUNT(DISTINCT Entity) AS unique_entities,
    COUNT(DISTINCT CONCAT(Entity, '||', COALESCE(Code, 'NULL'))) AS unique_entity_code_pairs
FROM pandemic.infectious_cases;