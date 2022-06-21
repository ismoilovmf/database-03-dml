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
musican_id INT REFERENCES musican(id)
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
album_id INT REFERENCES album(id)
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
collection_id INT REFERENCES collection(id)
);