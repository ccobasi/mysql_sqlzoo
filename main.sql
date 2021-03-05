--select basic

SELECT population
FROM world
WHERE name = 'Germany';

SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000;

--select world

SELECT name, continent, population
FROM world;

SELECT name
FROM world
WHERE population >= 200000000;

SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany','Italy');

SELECT name
FROM world
WHERE name LIKE '%United%';

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000)
OR (area < 3000000 AND population > 250000000);

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000;

SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital);

SELECT name, capital
FROM world
WHERE (LEFT(name,1) = LEFT(capital,1)) AND (name <> capital)

SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
AND name NOT LIKE '% %';

--select from nobel

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

SELECT winner 
FROM nobel
WHERE winner LIKE 'John%';

SELECT yr, subject, winner 
FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;

SELECT yr, subject, winner 
FROM nobel
WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine';

SELECT yr, subject, winner 
FROM nobel
WHERE yr < 1910 AND subject = 'Medicine' OR yr >= 2004 AND subject = 'Literature';

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'; 

SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY 
CASE
WHEN subject IN ('Physics', 'Chemistry') THEN 1
ELSE 0
END,
subject, winner;

--nested queries

SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

SELECT name
FROM world
WHERE continent = 'Europe' AND GDP/population > 
(SELECT GDP/population 
FROM world
WHERE name = 'United Kingdom');

SELECT name, continent
FROM world
WHERE continent = 'South America' OR continent = 'Oceania'
ORDER BY name;

SELECT name, population
FROM world
WHERE population > 
(SELECT population
FROM world
WHERE name = 'Canada') AND population < 
(SELECT population
FROM world
WHERE name = 'Poland');

SELECT name, 
CONCAT(ROUND(population/(SELECT population
ROM world
WHERE name = 'Germany')*100, 0), '%')AS percentage
FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp >
ALL(SELECT gdp
FROM world
WHERE continent = 'Europe' AND GDP > 0);

-- sum and count
SELECT SUM(population)
FROM world;

SELECT DISTINCT(continent)
FROM world;

SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa';

SELECT COUNT(name)
FROM world
WHERE area >=1000000;

SELECT SUM(population)
FROM world
WHERE name = 'Estonia' OR name = 'Latvia' OR name = 'Lithuania';

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;