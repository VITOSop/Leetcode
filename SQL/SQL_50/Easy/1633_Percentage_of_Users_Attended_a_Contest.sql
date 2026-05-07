SELECT B.contest_id ,
    ROUND(
        (COUNT(DISTINCT B.user_id)*100)/(SELECT COUNT(*) FROM Users)
        ,2
    )AS percentage 
FROM Users A
JOIN Register B
ON A.user_id  = B.user_id 
GROUP BY B.contest_id 
ORDER BY percentage DESC, B.contest_id ;
