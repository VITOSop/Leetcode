SELECT person_name 
FROM (
    SELECT *,
        SUM(Weight ) OVER (ORDER BY Turn) AS running_sum
    FROM Queue 
)t
WHERE running_sum <= 1000 
ORDER BY running_sum DESC
LIMIT 1;
