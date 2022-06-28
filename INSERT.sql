INSERT INTO genre (name) VALUES 
('Genre name 1'),
('Genre name 2'),
('Genre name 3'),
('Genre name 4'),
('Genre name 5');

INSERT INTO musican (name, age) VALUES 
('Musican name 1', 35),
('Musicanname2', 55),
('Musican name 3', 47),
('Musican name 4', 18),
('Musican name 5', 26),
('Musicanname6', 24),
('Musican name 7', 44),
('Musican name 8', 25);

INSERT INTO genremusican (genre_id, musican_id) VALUES 
(4, 2),
(3, 2),
(2, 3),
(5, 4),
(3, 5),
(1, 6),
(2, 7),
(5, 8),
(1, 2),
(3, 6),
(5, 3),
(1, 1),
(4, 7),
(1, 5);

INSERT INTO album (name, release_date) VALUES 
('Album name 1', '2019-11-30'),
('Album name 2', '2015-05-22'),
('Album name 3', '2021-12-15'),
('Album name 4', '2014-07-22'),
('Album name 5', '2019-01-12'),
('Album name 6', '2013-05-19'),
('Album name 7', '2018-11-27'),
('Album name 8', '2020-12-31');

INSERT INTO musicanalbum (musican_id, album_id) VALUES 
(8 , 1),
(7 , 2),
(6 , 3),
(5 , 4),
(4 , 5),
(3 , 6),
(2 , 2),
(1 , 8),
(2 , 7),
(3 , 1),
(4 , 2),
(5 , 3),
(6 , 4),
(7 , 5),
(8 , 6);

INSERT INTO track (name, length, album_id) VALUES
('Track name 1', '00:04:30', 8),
('Track name 2', '00:05:30', 7),
('Track name 3', '00:03:30', 6),
('My Track name 4', '00:02:30', 5),
('Track name 5', '00:01:30', 4),
('Track name 6', '00:04:20', 3),
('Track name 7', '00:05:20', 2),
('Track name 8', '00:03:20', 1),
('Мой Track name 9', '00:02:20', 1),
('Track name 10', '00:01:20', 2),
('Track name 11', '00:04:35', 3),
('My Track name 12', '00:05:35', 4),
('Track name 13', '00:03:35', 5),
('Track name 14', '00:02:35', 6),
('Track name 15', '00:01:35', 7);

INSERT INTO collection (name, release_date) VALUES 
('Collection name 1', '2019-11-30'),
('Collection name 2', '2021-12-15'),
('Collection name 3', '2019-01-12'),
('Collection name 4', '2018-11-27'),
('Collection name 5', '2015-05-22'),
('Collection name 6', '2014-07-22'),
('Collection name 7', '2021-05-19'),
('Collection name 8', '2020-12-31');

INSERT INTO trackcollection (track_id, collection_id) VALUES
(15 , 1),
(14 , 2),
(13 , 3),
(12 , 4),
(11 , 5),
(10 , 6),
(9 , 5),

(7 , 1),
(6 , 2),
(5 , 3),
(4 , 4),

(2 , 6),
(1 , 7),
(2 , 8),

(4 , 2),
(5 , 5),
(6 , 4),
(7 , 5),

(9 , 7),
(10 , 8),
(11 , 1),
(12 , 2),
(13 , 6),
(14 , 4),
(15 , 5);
