SELECT
	DISTINCT a.name AS artista,
	ab.name AS album,
  COUNT(f.user_id) AS seguidores
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.album AS ab ON a.artist_id = ab.artist_id
INNER JOIN SpotifyClone.follower AS f ON a.artist_id = f.artist_id
GROUP BY ab.album_id
ORDER BY seguidores DESC;