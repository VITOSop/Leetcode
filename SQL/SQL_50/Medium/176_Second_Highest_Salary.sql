APPROACH I:
SELECT MAX(salary) AS SecondHighestSalary 
FROM Employee 
WHERE salary < (
    SELECT MAX(salary) FROM Employee 
);

APPROACH II:

SELECT (
    SELECT DISTINCT salary
    FROM Employee 
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;


APPROACH III:

SELECT (
    SELECT salary
    FROM (
        SELECT salary,
               DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM Employee
    ) t
    WHERE rnk = 2
    LIMIT 1
) AS SecondHighestSalary;
