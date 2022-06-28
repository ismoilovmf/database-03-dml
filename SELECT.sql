--ДЗ №2

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


--ДЗ №3

-- количество исполнителей в каждом жанре;
SELECT g."name", count(*) FROM genre g
JOIN genremusican gm
ON g.id = gm.genre_id  
GROUP BY g."name"
ORDER BY g."name";

-- количество треков, вошедших в альбомы 2019-2020 годов;
SELECT a."name", COUNT(*)  FROM track t 
JOIN album a 
ON t.album_id = a.id 
WHERE a.release_date BETWEEN '20181231' AND '20200101'-- 20190101 AND 20200131
GROUP BY a."name";

-- средняя продолжительность треков по каждому альбому;
SELECT a."name", AVG(length) FROM album a
JOIN track t
ON a.id = t.album_id
GROUP BY a."name"
ORDER BY a."name";

-- все исполнители, которые не выпустили альбомы в 2020 году;
/* Способ №1 через JOIN */
SELECT m."name" FROM musican m
JOIN musicanalbum ma
ON m.id = ma.musican_id
JOIN album a
ON ma.album_id = a.id
WHERE a.release_date NOT BETWEEN '20200101' AND '20201231'
GROUP BY m."name"
ORDER BY m."name";

/* Способ №2 без JOIN */
SELECT musican."name" FROM musican, album, musicanalbum
WHERE musican.id = musican_id AND album.id = album_id AND release_date NOT  BETWEEN '20200101' AND '20201231'
GROUP BY musican."name"
ORDER BY musican."name";

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
-- на выбор исполнитель Musican name 3
/* Способ №1 через JOIN */
SELECT c."name"  FROM collection c
JOIN trackcollection tc
ON c.id = tc.collection_id
JOIN track t
ON tc.track_id = t.id
JOIN album a
ON t.album_id = a.id
JOIN musicanalbum ma
ON a.id = ma.album_id
JOIN musican m
ON ma.musican_id = m.id
WHERE m."name" = 'Musican name 3'
GROUP BY c."name"
ORDER BY c."name";

/* Способ №2 без JOIN */
SELECT collection."name" FROM musican, musicanalbum, album, track, trackcollection, collection
WHERE track.id = track_id AND collection_id = collection.id AND 
album.id = track.album_id AND musican.id = musican_id AND 
album.id = musicanalbum.album_id AND musican."name" = 'Musican name 3'
GROUP BY collection."name"
ORDER BY collection."name";

-- название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a."name", COUNT(*) FROM genre g
JOIN genremusican gm
ON g.id = gm.genre_id
JOIN musican m
ON gm.musican_id = m.id
JOIN musicanalbum ma
ON m.id = ma.musican_id 
JOIN album a
ON ma.album_id = a.id
GROUP BY a."name"
HAVING COUNT(*) > 1
ORDER BY a."name";

-- наименование треков, которые не входят в сборники;
SELECT t."name"  FROM genre g
JOIN genremusican gm
ON g.id = gm.genre_id
JOIN musican m
ON gm.musican_id = m.id
JOIN musicanalbum ma
ON m.id = ma.musican_id 
JOIN album a
ON ma.album_id = a.id
JOIN track t
ON a.id = t.album_id 
JOIN trackcollection tc
ON t.id = tc.track_id
JOIN collection c
ON tc.collection_id = c.id
GROUP BY t."name" 
HAVING t."name" NOT IN (SELECT name FROM track);

/* исполнителя(-ей), написавшего самый короткий 
по продолжительности трек (теоретически таких треков может быть несколько);	*/
SELECT m."name", t.length FROM musican m
JOIN musicanalbum ma
ON m.id = ma.musican_id
JOIN album a
ON ma.album_id = a.id
JOIN track t
ON a.id = t.album_id
WHERE t.length = (
SELECT MIN(length) FROM track)
GROUP BY m."name", t.length;

-- название альбомов, содержащих наименьшее количество треков.
SELECT name FROM (
SELECT a."name" , COUNT(*) mycount FROM album a
JOIN track t
ON a.id = t.album_id
GROUP BY a."name") tepltab
WHERE mycount = (SELECT COUNT(*) mycount FROM album a
JOIN track t
ON a.id = t.album_id
GROUP BY a."name"
ORDER BY mycount
LIMIT 1);
