SELECT B.name 
FROM Employee A
JOIN Employee B
ON A.managerId = B.id
GROUP BY B.id,B.name
HAVING COUNT(B.id) >= 5 ;
