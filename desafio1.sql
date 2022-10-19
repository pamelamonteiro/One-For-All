DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
      plan_id INT AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL,
      price DECIMAL(5, 2) NOT NULL,
      PRIMARY KEY (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_id INT AUTO_INCREMENT,
      plan_id INT NOT NULL,
      name VARCHAR(255) NOT NULL,
      age INT NOT NULL,
      subscription_date DATE NOT NULL,
      PRIMARY KEY (user_id),
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
      artist_id INT AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL,
      PRIMARY KEY (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT AUTO_INCREMENT,
      artist_id INT NOT NULL,
      name VARCHAR(255) NOT NULL,
      release_year INT NOT NULL,
      PRIMARY KEY (album_id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.song(
      song_id INT AUTO_INCREMENT,
      album_id INT NOT NULL,
      name VARCHAR(255) NOT NULL,
      duration INT NOT NULL,
      PRIMARY KEY (song_id),
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproduction(
      user_id INT NOT NULL,
      song_id INT NOT NULL,
      date DATETIME NOT NULL,
      PRIMARY KEY (user_id, song_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
      FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(song_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.follower(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      PRIMARY KEY (user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artist (name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.album (artist_id, name, release_year)
  VALUES
    (1, 'Renaissance', 2022),
    (2, 'Jazz', 1978),
    (2, 'Hot Space', 1982),
    (3, 'Falso Brilhante', 1998),
    (3, 'Vento de Maio', 2001),
    (4, 'QVVJFA?', 2003),
    (5, 'Somewhere Far Beyond', 2007),
    (6, 'I Put A Spell On You', 2012);

  INSERT INTO SpotifyClone.plan (name, price)
  VALUES
    ('free', 0.00),
    ('family', 7.99),
    ('student', 5.99),
    ('personal', 6.99);

  INSERT INTO SpotifyClone.song (album_id, name, duration)
  VALUES
    (1, 'BREAK MY SOUL', 279),
    (1, 'VIRGO"S GROOVE', 369),
    (1, 'ALIEN SUPERSTAR', 116),
    (2, 'Don"t Stop Me Now', 203),
    (3, 'Under Pressure', 152),
    (4, 'Como Nossos Pais', 105),
    (5, 'O Medo de Amar é o Medo de Ser Livre', 207),
    (6, 'Samba em Paris', 267),
    (7, 'The Bard"s Song', 244),
    (8, 'Feeling Good', 100);

  INSERT INTO SpotifyClone.user (plan_id, name, age, subscription_date)
  VALUES
    (1, 'Barbara Liskov', 82, '2019-10-20'),
    (1, 'Robert Cecil Martin', 58, '2017-01-06'),
    (2, 'Ada Lovelace', 37, '2017-12-30'),
    (2, 'Martin Fowler', 46, '2017-01-17'),
    (2, 'Sandi Metz', 58, '2018-04-29'),
    (3, 'Paulo Freire', 19, '2018-02-14'),
    (3, 'Bell Hooks', 26, '2018-01-05'),
    (4, 'Christopher Alexander', 85, '2019-06-05'),
    (4, 'Judith Butler', 45, '2020-05-13'),
    (4, 'Jorge Amado', 58, '2017-02-17');

  INSERT INTO SpotifyClone.reproduction (user_id, song_id, date)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:20:22');

  INSERT INTO SpotifyClone.follower (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);