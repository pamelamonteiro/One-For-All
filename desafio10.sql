SELECT
	s.name AS nome,
	COUNT(r.song_id) AS reproducoes
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.reproduction AS r ON s.song_id = r.song_id
INNER JOIN SpotifyClone.user AS u ON u.user_id = r.user_id
INNER JOIN SpotifyClone.plan AS p ON u.plan_id = p.plan_id
WHERE p.name LIKE 'free' OR p.name LIKE 'personal'
GROUP BY nome
ORDER BY nome;