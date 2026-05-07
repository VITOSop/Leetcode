SELECT b.product_name,a.year,a.price 
FROM Sales a
JOIN Product b
  on a.product_id=b.product_id ;
