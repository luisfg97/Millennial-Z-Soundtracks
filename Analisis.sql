USE spotify;

-- CANCIONES MAS ESCUCHADAS

SELECT year, artist, song, popularity
FROM songs 
JOIN artist ON artist.artist_id=songs.artist_id
ORDER BY popularity DESC;

-- ARTISTAS MAS ESCUCHADOS
SELECT 
artist.artist,
COUNT(songs.artist_id) AS apariciones,
ROUND(AVG(songs.popularity),2) AS popularity
FROM songs
INNER JOIN artist
ON artist.artist_id=songs.artist_id
GROUP BY artist.artist_id
ORDER BY popularity DESC;

SELECT 
artist.artist,
COUNT(songs.artist_id) AS apariciones
FROM songs
INNER JOIN artist
ON artist.artist_id=songs.artist_id
GROUP BY artist.artist_id
ORDER BY apariciones DESC;

-- GENEROS MAS ESCUCHADOS
SELECT 
genres.genre,
COUNT(songs.genre_id) AS num_generos
FROM songs
INNER JOIN genres
ON genres.genre_id=songs.genre_id
GROUP BY genres.genre_id
ORDER BY num_generos DESC;

-- CLASIFICAR CANCIONES POR ENERGIA O TEMPO (CANCIONES IDEALES PARA FRANJAS DE ENERGIA)

SELECT
  CASE
    WHEN caracteristics.energy > 0.7 THEN 'Alta'
    WHEN caracteristics.energy < 0.4 THEN 'Baja'
    ELSE 'Media'
  END AS nivel_energia,
  COUNT(songs.song_id) AS numero_canciones
FROM songs
JOIN caracteristics ON songs.caracteristicas_id = caracteristics.caracteristicas_id
GROUP BY nivel_energia;

-- PROPUESTA DE PROGRAMACION ( MAÑANA CANCIONES CON ENERGIA > 0.7 , NOCTURNA ENERGIA < 0.4 Y VALENCE <0.5, MOTIVACIONAL TEMPO>120 Y VALENCE > 0.6)

-- MAÑANA
CREATE VIEW playlist_mañana AS
SELECT
song,
artist.artist,
caracteristics.energy
FROM songs
JOIN caracteristics ON songs.caracteristicas_id = caracteristics.caracteristicas_id
JOIN artist ON artist.artist_id = songs.artist_id
WHERE caracteristics.energy > 0.7;

-- NOCHE
CREATE VIEW playlist_noche AS
SELECT
song,
artist.artist,
caracteristics.energy,
caracteristics.valence
FROM songs
JOIN caracteristics ON songs.caracteristicas_id = caracteristics.caracteristicas_id
JOIN artist ON artist.artist_id = songs.artist_id
WHERE caracteristics.energy < 0.4 AND valence < 0.5;

-- MOTIVACIONAL

CREATE VIEW playlist_motivacional AS
SELECT
song,
artist.artist,
caracteristics.tempo,
caracteristics.valence
FROM songs
JOIN caracteristics ON songs.caracteristicas_id = caracteristics.caracteristicas_id
JOIN artist ON artist.artist_id = songs.artist_id
WHERE caracteristics.tempo > 120 AND caracteristics.valence > 0.6;