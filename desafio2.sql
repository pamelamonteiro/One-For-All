SELECT
	COUNT(DISTINCT s.song_id) AS cancoes,
  COUNT(DISTINCT artist_id) AS artistas,
  COUNT(DISTINCT a.album_id) AS albuns
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.album AS a
ON s.album_id = a.album_id;