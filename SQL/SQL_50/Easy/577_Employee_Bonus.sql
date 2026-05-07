SELECT a.name,b.bonus 
FROM employee a 
LEFT JOIN bonus b
 ON a.empid=b.empid 
where  b.bonus < 1000 OR b.bonus is null;
