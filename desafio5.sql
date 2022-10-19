SELECT
	s.name AS cancao,
    COUNT(r.song_id) AS reproducoes
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.reproduction AS r ON s.song_id = r.song_id 
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;