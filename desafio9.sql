SELECT COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction AS r ON u.user_id = r.user_id
GROUP BY u.name
HAVING u.name = 'Barbara Liskov';