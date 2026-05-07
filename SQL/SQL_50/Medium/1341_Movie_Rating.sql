(   
    SELECT A.name AS results  
    FROM Users A
        JOIN MovieRating B ON A.user_id = B.user_id     
    GROUP BY A.user_id     
    ORDER BY COUNT(*) DESC,A.name
    LIMIT 1
)

UNION ALL
(
    SELECT C.title AS results  
    FROM Movies C
        JOIN MovieRating D ON C.movie_id = D.movie_id    
    WHERE D.created_at LIKE '2020-02-%'
    GROUP BY C.movie_id
    ORDER BY AVG(D.rating) DESC,C.title
    LIMIT 1
) ;
