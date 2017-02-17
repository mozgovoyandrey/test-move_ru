--
-- Первый вариант реализации данной задачи
--

-- ID пользователей с 6 и более друзьями
SELECT user
FROM friends
GROUP BY user
HAVING count(*) > 5;

-- Имена пользователей с 6 и более друзьями
SELECT u.name
FROM friends f
LEFT JOIN users u ON f.user=u.id
GROUP BY f.user
HAVING count(*) > 5;

-- Пары друзей (ID)
SELECT f.user, f.friend
FROM friends f
LEFT JOIN friends o ON f.user=o.friend AND f.friend=o.user
WHERE o.user IS NOT NULL AND f.user<f.friend;

-- Пары друзей (Имена)
SELECT u1.name, u2.name
FROM friends f
LEFT JOIN users u1 ON f.user=u1.id
LEFT JOIN users u2 ON f.friend=u2.id
LEFT JOIN friends o ON f.user=o.friend AND f.friend=o.user
WHERE o.user IS NOT NULL AND f.user<f.friend


--
-- Второй вариант реализации данной задачи
--

-- Более 5 друзей (ID)
SELECT user
FROM (SELECT user1 user, friend1 friend
FROM friends2 f1
WHERE friend1 = '1'
UNION ALL
SELECT user2, friend2
FROM friends2 f2 
WHERE friend2 = '1') t
GROUP BY user
HAVING count(*)>5;

-- Более 5 друзей (Имена)
SELECT u.name
FROM (SELECT user1 user, friend1 friend
FROM friends2 f1
WHERE friend1 = '1'
UNION ALL
SELECT user2, friend2
FROM friends2 f2 
WHERE friend2 = '1') t
LEFT JOIN users u ON t.user=u.id
GROUP BY user
HAVING count(*)>5;

-- Пары друзей (ID)
SELECT user1, user2
FROM friends2
WHERE friend1 = '1' AND friend2 = '1';

-- Пары друзей (Имена)
SELECT u1.name, u2.name
FROM friends2 f
LEFT JOIN users u1 ON f.user1=u1.id
LEFT JOIN users u2 ON f.user2=u2.id
WHERE f.friend1 = '1' AND f.friend2 = '1';