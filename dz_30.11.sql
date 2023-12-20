-- 1
SELECT SUM(country_1_score + country_2_score) AS 'Total goals'
FROM Match;

-- 2
SELECT
  m.ID AS match_id,
  m.country_1_score,
  m.country_2_score,
  (m.country_1_score + m.country_2_score) / 2.0 AS 'AVG'
FROM
  Match m;


--3
--MAX_GOALS
SELECT TOP 1
  m.ID AS match_id,
  m.country_1_score + m.country_2_score AS total_goals,
  m1.name AS team_1,
  m2.name AS team_2
FROM
  Match m
  INNER JOIN Country m1 ON m.id_country_1 = m1.ID
  INNER JOIN Country m2 ON m.id_country_2 = m2.ID
ORDER BY
  total_goals DESC;

-- MIN_GOALS
SELECT TOP 1
  m.ID AS match_id,
  m.country_1_score + m.country_2_score AS total_goals,
  m1.name AS team_1,
  m2.name AS team_2
FROM
  Match m
  INNER JOIN Country m1 ON m.id_country_1 = m1.ID
  INNER JOIN Country m2 ON m.id_country_2 = m2.ID
ORDER BY
  total_goals;


-- 4
SELECT SUM(visitors) AS 'Total visitors'
FROM Match;

-- 5
SELECT AVG(visitors) AS 'Average visitors per match'
FROM Match;

-- 6
SELECT TOP 10 p.name AS 'Player',
              COUNT(gm.ID) AS 'Goals count'
FROM Player p
JOIN Goal_moment gm ON p.ID = gm.id_player
GROUP BY p.name
ORDER BY 'Goals count' DESC;