SELECT 'ФИО: Кирдяшкин Игорь Вячеславович';
-- 1.Простые выборки
-- 1.1
SELECT * 
FROM movie.ratings 
LIMIT 10;
-- 1.2
SELECT * 
FROM movie.links 
WHERE imdbid 
    LIKE '%42' 
    AND movieid > 100 
    AND movieid < 1000;
-- 2.Сложные выборки
SELECT imdbid, rating 
FROM movie.links 
JOIN movie.ratings
    ON movie.ratings.movieid = movie.ratings.movieid
WHERE movie.ratings.rating = 5
LIMIT 10;
-- 3.Аггрегация данных: базовые статистики
-- 3.1
SELECT count(*) 
FROM movie.ratings 
RIGHT JOIN movie.links
    ON movie.ratings.movieid=movie.links.movieid
WHERE movie.ratings.rating IS NULL;
-- 3.2
SELECT userId, AVG(rating) as avg_rating
FROM movie.ratings
GROUP BY userId
HAVING AVG(rating) > 3.5
LIMIT 10;
-- 4.Иерархические запросы
-- 4.1
SELECT imdbid, AVG(rating) as avg_rating
FROM movie.links
JOIN movie.ratings
   ON movie.ratings.movieid=movie.links.movieid
GROUP BY imdbid
HAVING AVG(rating)>3.5
LIMIT 10;
-- 4.2
WITH tmp_table
AS (
    SELECT userid, COUNT(*)
    FROM movie.ratings
    GROUP BY userid
    HAVING COUNT(*) > 10)
SELECT AVG(rating) AS active_user_rating
FROM movie.ratings
JOIN tmp_table
    ON movie.ratings.userid = tmp_table.userid;
    