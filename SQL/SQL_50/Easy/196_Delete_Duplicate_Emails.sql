APPROACH I:

DELETE p1
FROM Person p1
JOIN Person p2 ON P1.email = p2.email
and p1.id > p2.id ;

APPROACH II:

WITH cte AS (
    SELECT 
        id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM person
)
DELETE p
FROM person p
JOIN cte c ON p.id = c.id
WHERE c.rn > 1;

APPROACH III:

DELETE FROM Person
WHERE id NOT IN(
    SELECT id FROM(
        SELECT MIN(id) as id
        FROM Person 
        GROUP BY email
    )t
) ;
