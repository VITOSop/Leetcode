SELECT IFNULL(max(num),NULL) as num
FROM MyNumbers 
WHERE num in (
    SELECT MAX(num)
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num)=1
)
