SELECT B.employee_id , B.name , COUNT(A.employee_id ) AS reports_count , 
ROUND(AVG(A.age),0) AS average_age 
FROM Employees A 
JOIN Employees B 
    ON A.reports_to  = B.employee_id 
GROUP BY B.employee_id , B.name
ORDER BY B.employee_id;
