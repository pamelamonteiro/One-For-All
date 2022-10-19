SELECT
	a.name AS artista,
	ab.name AS album
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.album AS ab ON a.artist_id = ab.artist_id
GROUP BY ab.album_id
HAVING a.name = 'Elis Regina'
ORDER BY artista;