-- 1-
SELECT id, title
FROM movie
WHERE yr = 1962;

-- 2-
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3-
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4- 
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5-
SELECT id
FROM movie
WHERE title = 'Casablanca';

-- 6-
SELECT name
FROM casting JOIN actor ON (actorid = id)
WHERE movieid=11768;

-- 7-
SELECT name
FROM casting JOIN actor ON (actorid = actor.id) JOIN movie ON (movieid = movie.id)
WHERE title = 'Alien';

-- 8-
SELECT title
FROM movie JOIN casting ON (movie.id = movieid) JOIN actor ON (actorid = actor.id)
WHERE name = 'Harrison Ford';

-- 9- 
SELECT title
FROM movie JOIN casting ON (movie.id = movieid) JOIN actor ON (actorid = actor.id)
WHERE name = 'Harrison Ford'
  AND ord != 1;

-- 10- 
SELECT title, name
FROM movie JOIN casting ON (movie.id = movieid) JOIN actor ON (actorid = actor.id)
WHERE yr = 1962 AND ord = 1;

-- 11- 
SELECT yr, COUNT(title)
FROM movie JOIN casting ON (movie.id=movieid) JOIN actor ON (actorid=actor.id)
WHERE name ='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC
LIMIT 2;

-- 12- 
SELECT title, name
FROM movie JOIN casting ON (movieid=movie.id) JOIN actor ON (actorid=actor.id)
WHERE movie.id IN 
(SELECT movieid
  FROM casting
  WHERE actorid IN 
(SELECT id
  FROM actor
  WHERE name='Julie Andrews'))AND ord=1;

-- #13-
SELECT name
FROM casting JOIN actor ON (actorid=actor.id)
WHERE ord=1
GROUP BY name
HAVING COUNT(name)>=15;

-- 14-
SELECT title, COUNT(actorid)
FROM movie JOIN casting ON (movie.id = movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;

-- 15-
SELECT DISTINCT(name)
FROM actor
WHERE actor.id IN
(SELECT actorid
  FROM casting JOIN actor ON (actor.id=actorid)
  WHERE movieid IN  
(SELECT movieid
  FROM casting JOIN actor ON (actor.id=actorid)
  WHERE actorid = 
(SELECT id
  FROM actor
  WHERE name = 'Art Garfunkel'))) AND name != 'Art Garfunkel';
