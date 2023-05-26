SELECT name_track, duration FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

SELECT name_track FROM tracks
WHERE duration >= '00:03:30';

SELECT name_collection FROM collections
WHERE release_yaer BETWEEN 2018 AND 2020;

SELECT alias FROM musicians
WHERE NOT alias LIKE '% %';

SELECT name_track FROM tracks
WHERE name_track LIKE 'мой' OR name_track LIKE 'my';

SELECT COUNT(*) AS quantity_musicians, id_style_music FROM styles_musicians
GROUP BY id_style_music
ORDER BY id_style_music;

SELECT COUNT(*) FROM tracks t
LEFT JOIN albums a ON t.album = a.id
WHERE a.release_yaer BETWEEN 2019 AND 2020;

SELECT AVG(duration), album FROM tracks
GROUP BY album
ORDER BY album;

SELECT m.alias FROM albums_musicians am
LEFT JOIN musicians m ON am.id_musician = m.id
LEFT JOIN albums a ON am.id_album = a.id
WHERE a.release_yaer != 2020;

SELECT name_collection FROM albums_musicians am
LEFT JOIN musicians m ON am.id_musician = m.id
LEFT JOIN albums a ON am.id_album = a.id
LEFT JOIN tracks t ON a.id = t.album
LEFT JOIN tracks_collections tc ON t.id = tc.id_track
LEFT JOIN collections c ON tc.id_collection = c.id
WHERE m.alias = 'Anacondaz';