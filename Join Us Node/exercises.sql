-- Exercise 1
SELECT DATE_FORMAT(created_at, "%b %D %Y") as 'earliest_date'
FROM users
ORDER BY created_at ASC
LIMIT 1;


-- Excercise 2
SELECT email, created_at
FROM users
WHERE created_at = (select min(created_at) from users);

-- Excercise 3
SELECT DATE_FORMAT(created_at, "%M") AS month, COUNT(email) as count
FROM users
GROUP BY month
ORDER BY count DESC;

-- Excercise 4
SELECT COUNT(email) AS 'yahoo_users'
FROM users 
WHERE email LIKE '%yahoo.com';

-- Excercise 5
SELECT CASE
	WHEN email LIKE '%yahoo.com' then 'yahoo'
	WHEN email LIKE '%gmail.com' then 'gmail'
	WHEN email LIKE '%hotmail.com' then 'hotmail'
	ELSE 'other'
END as 'provider', 
COUNT(email) AS 'total_users'
FROM users 
GROUP BY provider
ORDER BY total_users DESC;