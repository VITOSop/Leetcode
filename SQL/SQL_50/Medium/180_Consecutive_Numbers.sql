SELECT DISTINCT num AS ConsecutiveNums 
FROM (
    SELECT *,
        LAG(num) OVER() AS prev,
        LEAD(num) OVER() AS next
    FROM Logs 
)t
WHERE prev = num AND num = next ;
