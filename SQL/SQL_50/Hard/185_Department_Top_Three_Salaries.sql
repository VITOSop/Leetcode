SELECT Department,Employee,Salary
FROM (
    SELECT B.name AS Department , 
    A.name AS Employee ,
    A.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY B.id ORDER BY A.salary DESC) AS rnk    
    FROM Employee A
    JOIN Department B 
        ON A.departmentId = B.id
)t
WHERE rnk <=3 ;
