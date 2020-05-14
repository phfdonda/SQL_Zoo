-- 1- Winners from 1950
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- 2- 1962 Literature
SELECT winner
FROM nobel
WHERE yr = 1962
  AND subject = 'Literature';

-- 3- Albert Einstein
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4- Recent Peace Prizes
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

-- 5- Literature in the 1980's
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject = 'Literature';

-- 6- Only Presidents
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter','Barack Obama');

-- 7- John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- 8- Chemistry and Physics from different years
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics'
  AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);