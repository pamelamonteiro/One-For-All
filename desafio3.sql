SELECT
	u.name AS usuario,
  COUNT(DISTINCT r.song_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(duration) / 60,2) AS total_minutos
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction AS r ON u.user_id = r.user_id
INNER JOIN SpotifyClone.song AS s ON s.song_id = r.song_id
GROUP BY u.name;