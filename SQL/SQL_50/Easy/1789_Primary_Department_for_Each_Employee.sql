APPROACH I :
SELECT employee_id , department_id 
FROM Employee 
WHERE primary_flag = 'Y'
    OR employee_id IN (
        SELECT employee_id 
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(employee_id ) = 1
    )

APPROACH II:

SELECT employee_id, department_id
FROM (
    SELECT 
        employee_id,
        department_id,
        COUNT(*) OVER (PARTITION BY employee_id) AS cnt,
        primary_flag
    FROM Employee
) t
WHERE 
    CASE 
        WHEN cnt = 1 THEN 1
        WHEN cnt > 1 AND primary_flag = 'Y' THEN 1
        ELSE 0
    END = 1;
