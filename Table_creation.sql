/*create database*/
DROP DATABASE IF EXISTS NBAa;
CREATE DATABASE NBAa;
USE NBAa;

/*create table for nba teams*/
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS teams;
SET FOREIGN_KEY_CHECKS = 1;CREATE TABLE teams (
team_abbreviation VARCHAR(100) NOT NULL,
conference VARCHAR(100) ,
division VARCHAR(100) NOT NULL,
PRIMARY KEY(team_abbreviation),
UNIQUE(team_abbreviation)
);

/*create table for nba players*/
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS players;
SET FOREIGN_KEY_CHECKS =1;
CREATE TABLE players (
player_id INT NOT NULL,
team_abbreviation VARCHAR(100) NOT NULL,
age DOUBLE NOT NULL CHECK(age>0.0),
height DOUBLE NOT NULL CHECK(height>0.0),
weight DOUBLE NOT NULL CHECK(weight>0.0),
college VARCHAR(100),
country VARCHAR(100),
draft_year INT,
draft_round INT,
player_name VARCHAR(100) NOT NULL,
PRIMARY KEY(player_id),
FOREIGN KEY(team_abbreviation) REFERENCES teams(team_abbreviation)
);

/*create the table for player statistics*/
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS playerStats;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE playerStats (
player_id INT NOT NULL,
average_points DOUBLE NOT NULL CHECK(average_points >=0),
average_assists DOUBLE NOT NULL CHECK(average_assists >=0),
average_rebounds DOUBLE NOT NULL CHECK(average_rebounds >=0),
PRIMARY KEY(player_id),
FOREIGN KEY(player_id) REFERENCES players(player_id)
);

/*create table for the games*/
DROP TABLE IF EXISTS games;
CREATE TABLE games (
game_id INT NOT NULL,
home_team VARCHAR(100) NOT NULL ,
away_team VARCHAR(100) NOT NULL ,
CHECK (home_team != away_team),
game_date DATE,
team_win VARCHAR(100),
PRIMARY KEY(game_id),
FOREIGN KEY(home_team) REFERENCES teams(team_abbreviation),
FOREIGN KEY(away_team) REFERENCES teams(team_abbreviation)
);

/*insert information for teams table*/
INSERT INTO teams (team_abbreviation, conference, division)
  VALUES('ATL', 'Eastern', 'Southeast'),
		('BOS', 'Eastern', 'Atlantic'),
		('BKN', 'Eastern', 'Atlantic'),
		('CHH', 'Eastern', 'Southeast'),
		('CHI', 'Eastern', 'Central'),
		('CLE', 'Eastern', 'Central'),
		('DAL', 'Western', 'Southwest'),
		('DEN', 'Western', 'Northwest'),
		('DET', 'Eastern', 'Central'),
		('GSW', 'Western', 'Pacific'),
		('HOU', 'Western', 'Southwest'),
		('IND', 'Eastern', 'Central'),
		('LAC', 'Western', 'Pacific'),
		('LAL', 'Western', 'Pacific'),
		('MEM', 'Western', 'Southwest'),
		('MIA', 'Eastern', 'Southeast'),
		('MIL', 'Eastern', 'Central'),
		('MIN', 'Western', 'Northwest'),
		('NOP', 'Western', 'Southwest'),
		('NYK', 'Eastern', 'Atlantic'),
		('OKC', 'Western', 'Northwest'),
		('ORL', 'Eastern', 'Southeast'),
		('PHI', 'Eastern', 'Atlantic'),
		('PHX', 'Western', 'Pacific'),
		('POR', 'Western', 'Northwest'),
		('SAC', 'Western', 'Pacific'),
		('SAS', 'Western', 'Southwest'),
		('TOR', 'Eastern', 'Atlantic'),
		('UTA', 'Western', 'Northwest'),
		('WAS', 'Eastern', 'Southeast'),
        ('VAN', 'Western', 'Midwest');
        
/*insert information for games table*/
INSERT INTO games (game_id, home_team, away_team, game_date, team_win)
  VALUES(1, 'LAL', 'BOS', DATE '2024-01-01', 'LAL'),
		(2, 'GSW', 'NYK', DATE '2024-01-02', 'GSW'),
        (3, 'LAC', 'CHI', DATE '2024-01-03', 'CHI'),
        (4, 'MIA', 'HOU', DATE '2024-01-04', 'MIA'),
        (5, 'TOR', 'SAS', DATE '2024-01-05', 'SAS'),
        (6, 'MIL', 'PHI', DATE '2024-01-06', 'MIL'),
		(7, 'DEN', 'NOP', DATE '2024-01-07', 'DEN'),
		(8, 'UTA', 'DAL', DATE '2024-01-08', 'UTA'),
		(9, 'BKN', 'ORL', DATE '2024-01-09', 'BKN'),
		(10, 'ATL', 'MEM', DATE '2024-01-10', 'MEM');
        
/*insert information for the players table*/
INSERT INTO players (player_id, team_abbreviation, age, height, weight, college, country, draft_year, draft_round, player_name)
  VALUES(1, 'WAS', 28.0, 190.5, 86.18248, 'Northwestern Oklahoma', 'USA', 1994, 2, 'Gaylon Nickerson'),
		(2, 'VAN', 26.0, 203.2, 103.418976, 'North Carolina', 'USA', 1993, 1, 'George Lynch'),
        (3, 'LAL', 30.0, 203.2, 102.0582, 'Florida State', 'USA', 1989, 1, 'George McCloud'),
        (4, 'DEN', 23.0, 213.36, 119.7482, 'UCLA', 'USA', 1995, 1, 'George Zidek'),
        (5, 'ORL', 33.0, 198.12, 102.0582, 'Tennessee-Chattanooga', 'USA',1985,2, 'Gerald Wilkins'),
        (6, 'WAS', 26.0, 231.14, 137.438376, 'None', 'USA', 1993, 2, 'Gheorghe Muresan'),
        (7, 'CHH', 30.0, 203.2, 99.79024, 'Michigan', 'USA', 1989, 1, 'Glen Rice'),
        (8, 'MIL', 24.0, 200.66, 106.59412, 'Purdue', 'USA', 1994,1, 'Glenn Robinson'),
        (9, 'DET', 24.0, 203.2, 102.0582, 'Duke', 'USA', 1994, 1, 'Grant Hill'),
        (10, 'POR', 22.0, 203.2, 113.398, 'Ohio', 'USA', 1995 ,1, 'Gary Trent');
        
        
/*insert information into the playerStats table*/
INSERT INTO playerStats (player_id, average_points, average_assists, average_rebounds)
  VALUES(1, 25.3, 6.7, 7.5),
		(2, 28.6, 8.2, 9.4),
		(3, 23.9, 10.1, 4.8),
		(4, 21.2, 5.5, 6.3),
		(5, 30.1, 8.3, 6.6),
		(6, 27.5, 9.6, 8.7),
		(7, 24.8, 7.9, 10.2),
		(8, 26.3, 7.1, 5.4),
		(9, 29.7, 9.8, 6.2),
		(10, 22.5, 9.4, 7.3);
DELIMITER $$
