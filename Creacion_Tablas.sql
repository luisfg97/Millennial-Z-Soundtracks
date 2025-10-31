use spotify;

SELECT song
FROM songs;

SELECT * FROM spotify.artist;
ALTER TABLE songs
MODIFY COLUMN artist_id INT;

ALTER TABLE artist
ADD PRIMARY KEY(artist_id);

ALTER TABLE caracteristics
ADD PRIMARY KEY(caracteristicas_id);

ALTER TABLE genres
ADD PRIMARY KEY(genre_id);

ALTER TABLE songs
ADD PRIMARY KEY(song_id);

ALTER TABLE songs
MODIFY artist_id INT;

ALTER TABLE songs
ADD FOREIGN KEY (artist_id) REFERENCES artist (artist_id) ON DELETE CASCADE;

ALTER TABLE songs
ADD FOREIGN KEY (genre_id) REFERENCES genres (genre_id) ON DELETE CASCADE;

ALTER TABLE songs
ADD FOREIGN KEY (caracteristicas_id) REFERENCES caracteristics (caracteristicas_id) ON DELETE CASCADE;

select year from songs order by year ;










