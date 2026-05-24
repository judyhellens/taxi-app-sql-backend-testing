SELECT
    company_name,
    COUNT(*) AS trips_amount
FROM cabs
INNER JOIN trips
ON cabs.cab_id = trips.cab_id
WHERE start_ts BETWEEN '2017-11-15'
AND '2017-11-16'
GROUP BY company_name
ORDER BY trips_amount DESC;
