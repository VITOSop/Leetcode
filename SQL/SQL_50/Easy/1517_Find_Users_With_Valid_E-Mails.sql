APPROACH I:

SELECT *
FROM Users
WHERE REGEXP_LIKE(mail,'^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$','c') 


APPROACH II:

SELECT *
FROM Users
WHERE  mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'
    AND BINARY RIGHT(mail,13) = '@leetcode.com'
