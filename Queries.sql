/*query 1*/
/*average height of players of "WAS" team*/
SELECT AVG(height)
  FROM players
  WHERE team_abbreviation = 'WAS';
        
/*query 2*/
/*using an inner join show all player that are part of the eastern conference*/
SELECT p.player_name, t.conference
  FROM players p INNER JOIN teams t
  USING (team_abbreviation)
  WHERE conference='Eastern';
  
/*query 3*/
/*average height in teams in the western conference*/
SELECT AVG(p.height) AS average_player_height, p.team_abbreviation, t.conference
  FROM players p INNER JOIN teams t 
  USING(team_abbreviation)
  GROUP BY team_abbreviation,t.conference
  HAVING conference='Western';
  
/*query 4*/
/*sum of average of all nba player teams in the western conference*/
SELECT SUM(ap.average_player_height)
  FROM(SELECT AVG(p.height) AS average_player_height, p.team_abbreviation, t.conference
  FROM players p INNER JOIN teams t 
  USING(team_abbreviation)
  GROUP BY team_abbreviation,t.conference
  HAVING conference='Western') AS ap;
  
  /*query 5*/
  /*create view that shows the best player*/
  DROP VIEW IF EXISTS best_player;
  CREATE VIEW best_player AS (
	SELECT p.player_name, MAX(ps.total_stats) AS max_total_stats
    FROM (SELECT player_id,(average_points + average_assists + average_rebounds) AS total_stats FROM playerStats)
    AS ps
    INNER JOIN
    players AS P
    USING(player_id)
    GROUP BY p.player_name
    ORDER BY max_total_stats DESC
    LIMIT 1
  );
  
SELECT * FROM best_player;

/*new player inserted and is better than current best player*/
INSERT IGNORE INTO playerStats 
  VALUES(11,40.0,40.0,40.0);
INSERT IGNORE INTO players
  VALUES(11, 'SAS', 22.0, 220.2, 113.398, 'Ohio', 'FRANCE', 2003 ,1, 'Victor Wembanyama');
  
/* since both playerStats and players table were altered by the addition of a player with better stats view now shows that player*/
SELECT* FROM best_player;

