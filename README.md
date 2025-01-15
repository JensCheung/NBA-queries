# NBA-queries
Series of SQL queries based on an NBA dataset found on kaggle.<br>
The dataset can be found at https://www.kaggle.com/datasets/justinas/nba-players-data<br>
The "games" table data was generated using CHATGPT 3.5

## Motivation
When I first started learning SQL and the concept of Relational Database Management System (RDBMS), I wanted to get practice and decided to combine it with one of my many passions; basketball.<br>
I decided to go with the NBA as it is one of the most popular basketball leagues worldwide and has large datasets already present.

## Tables

### Tables_creation
This file contains the SQL for table creation. The tables were created as such that the database is in the Third normal form. <br>
The constraints for the tables include key business rules such as team_abbreviation being unique as there cannot and is not duplicate team names.<br>
Moreover, constraints have been placed to ensure data validity such as age greater than 18, and cannot be null as all players have an age.<br>
Note that as of 2005 the NBA has set the age limit to 19 but since the dataset contains data from before that year the constraint has been set to greater than 18.<br>
Furthermore, the tables are filled with data using "INSERT INTO" and only part of the dataset was used for testing purposes.

### Procedures
Sequence of procedures to replicate NBA events such as player trades and team creation. <br>
- The player_trade procedure, this is used whenever a trade has been made and a 
player’s team needs to be updated it takes in 2 parameters namely the player’s 
name and the new team. <br>   It takes 2 IN parameters as no output is necessary it will 
locate the player through the player name and change the team name to the second 
parameter <br>
- The second procedure, new_team is used when a new team enters the league. It 
takes in 3 parameters namely: team, conference and division. <br>It uses 3 IN 
parameters as again no output is required. The user will have to provide all 3 
parameters in the call.

### Queries
Series of queries that uses Table joins, subqueries, aggregation tools and views
- Query 1, it displays the average height of players on the Washington team “WAS” <br>
- Query 2, it displays the players’ name who are in the eastern conference <br>
- Query 3, it displays the average height of players who are part of the western conference<br> 
- Query 4, it displays the sum of the average height of each team in the  western conference<br> 
- Query 5, create a view that identifies the best player by selecting the player who has 
the highest total stats; the latter being the aggregation of the 3 statistics of 
playerStats table when selected it first displays George Flynch and his total stats. <br>
However, after the addition of a new player with higher total stats when called again 
the view shows the new player with his total stats. This view will always show the 
player with the highest total stats line. 
