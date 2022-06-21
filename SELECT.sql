SELECT name, release_date FROM album
WHERE release_date BETWEEN '20180101' AND '20181231';

SELECT name, length FROM track
ORDER BY length DESC 
LIMIT 1;

SELECT name FROM track
WHERE length > '00:03:29'; 

SELECT name, release_date FROM collection
WHERE release_date BETWEEN '20180101' AND '20200101';

SELECT name FROM musican
WHERE name NOT LIKE '% %';

SELECT name FROM track
WHERE name LIKE '%My%' OR name LIKE '%Мой%';
