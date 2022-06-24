DROP TABLE IF EXISTS genremusican;
DROP TABLE IF EXISTS musicanalbum;
DROP TABLE IF EXISTS trackcollection;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS collection;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS musican;
CREATE TABLE IF NOT EXISTS genre
(
id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS musican
(
id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
age INT
);

CREATE TABLE IF NOT EXISTS genremusican
(
genre_id INT REFERENCES genre(id),
musican_id INT REFERENCES musican(id),
PRIMARY KEY(genre_id, musican_id)
);

CREATE TABLE IF NOT EXISTS album
(
id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
release_date DATE
);

CREATE TABLE IF NOT EXISTS musicanalbum
(
musican_id INT REFERENCES musican(id),
album_id INT REFERENCES album(id),
PRIMARY KEY(musican_id, album_id)
);

CREATE TABLE IF NOT EXISTS track
(
id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
length TIME,
album_id INT REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection
(
id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
release_date DATE
);

CREATE TABLE IF NOT EXISTS trackcollection
(
track_id INT REFERENCES track(id),
collection_id INT REFERENCES collection(id),
PRIMARY KEY(track_id, collection_id)
);