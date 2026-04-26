SELECT
    id,
    date,
    UNIX_TIMESTAMP(date) AS timestamp_seconds
FROM orders;
