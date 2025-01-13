USE NBAa;

/*procedure when a player is traded, sets the players team to his new team*/
DELIMITER $$
DROP PROCEDURE IF EXISTS player_trade $$
CREATE PROCEDURE player_trade(IN player VARCHAR(100),IN team VARCHAR(100)) 
BEGIN
	START TRANSACTION;
	  UPDATE players
        SET team_abbreviation = team
        WHERE player_name = player AND player_id != 10000;
	COMMIT;
END;
$$

SET @player_to_change := "Gaylon Nickerson";
SET @team_to_change := "VAN";
CALL player_trade(@player_to_change, @team_to_change);

DELIMITER $$ 
DROP PROCEDURE IF EXISTS new_team $$
CREATE PROCEDURE new_team(IN team VARCHAR(100), IN conference VARCHAR(100), IN division VARCHAR(100))
BEGIN
  START TRANSACTION;
	INSERT IGNORE INTO teams
      VALUES(team,conference,division);
  COMMIT;
END;
$$

CALL new_team("HFX","Eastern", "Northeastern");