SELECT B.id
FROM Weather A
JOIN Weather B
ON B.recordDate = DATE_ADD(A.recordDate,INTERVAL 1 DAY)
WHERE B.temperature > A.temperature ;
