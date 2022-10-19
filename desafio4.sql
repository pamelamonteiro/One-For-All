SELECT
	u.name AS usuario,
  IF(YEAR(MAX(r.date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction AS r ON u.user_id = r.user_id
GROUP BY u.name
ORDER BY u.name ASC;