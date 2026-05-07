select A.product_name,
    SUM(B.unit) AS unit
FROM Products A
JOIN Orders B
    ON A.product_id = B.product_id  
WHERE  B.order_date REGEXP '2020-02-[0-9]{2}'
GROUP BY A.product_name 
HAVING unit >= 100 ;
