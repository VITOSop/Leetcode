SELECT A.project_id ,
    ROUND(
        IFNULL(AVG(B.experience_years),0)
        ,2
    )AS average_years 
FROM Project  A
LEFT JOIN Employee  B
ON A.employee_id  = B.employee_id 
GROUP BY A.project_id ;
