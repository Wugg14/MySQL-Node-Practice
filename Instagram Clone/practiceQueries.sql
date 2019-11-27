-- PROBLEM 1
SELECT * FROM users
ORDER BY created_at ASC 
LIMIT 0, 5;

-- PROBLEM 2
SELECT 
	count(username),
	DAYNAME(created_at) AS Day
FROM users
GROUP BY Day;

-- PROBLEM 3
SELECT
	username
FROM users
LEFT JOIN photos 
	ON users.id = photos.user_id
WHERE image_url IS NULL;

-- PROBLEM 4
SELECT
	username, photos.id, COUNT(*) as total
FROM users
JOIN photos
	ON users.id = photos.user_id
JOIN likes
	ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY total DESC;

-- Select all likes by user
SELECT
	username, COUNT(*)
FROM users
JOIN likes
ON users.id = likes.user_id
GROUP BY username;

-- PROBLEM 5
SELECT
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) as avg;
	
-- PROBLEM 6
SELECT tag_name, COUNT(tag_id) AS number
FROM tags
JOIN photo_tags
	ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY number DESC
LIMIT 5;

-- PROBLEM 7

SELECT username, COUNT(*) AS total
FROM users11
JOIN likes
	on users.id = likes.user_id
GROUP BY users.id
HAVING total = (SELECT COUNT(*) FROM photos);
