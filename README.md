# Football Database Project

This project involves managing a football (soccer) database that includes information about teams, players, matches, and goals. The database is designed to store and retrieve data related to football matches, player statistics, and team performance.

## Database Schema

The database consists of four main tables:

1. **Teams**: Stores information about football teams.
2. **Players**: Stores information about players, including their goals and assists.
3. **Matches**: Stores information about matches, including home and away teams, goals scored, and the stadium.
4. **Goals**: Stores information about individual goals scored in matches, including the type of goal.

### Schema Details

- **Teams**:
  - `team_id`: Primary key.
  - `team_name`: Name of the team.
  - `country`: Country of the team.
  - `coach`: Coach of the team.

- **Players**:
  - `player_id`: Primary key.
  - `player_name`: Name of the player.
  - `team_id`: Foreign key referencing the `Teams` table.
  - `position`: Position of the player.
  - `goals_scored`: Number of goals scored by the player.
  - `assists`: Number of assists by the player.

- **Matches**:
  - `match_id`: Primary key.
  - `home_team_id`: Foreign key referencing the home team in the `Teams` table.
  - `away_team_id`: Foreign key referencing the away team in the `Teams` table.
  - `home_goals`: Number of goals scored by the home team.
  - `away_goals`: Number of goals scored by the away team.
  - `stadium`: Stadium where the match was played.

- **Goals**:
  - `goal_id`: Primary key.
  - `match_id`: Foreign key referencing the `Matches` table.
  - `player_id`: Foreign key referencing the `Players` table.
  - `team_id`: Foreign key referencing the `Teams` table.
  - `goal_type`: Type of goal (e.g., Penalty, Own Goal, Open Play).

## SQL Queries

The project includes a set of SQL queries to retrieve various insights from the database, such as:

1. **Retrieve all players who have scored more than 5 goals.**
2. **Find teams that have scored more goals at home than away.**
3. **Show all matches where the home team scored 3 or more goals.**
4. **List players with NULL values in the assists column.**
5. **Retrieve teams that have at least one player with more than 10 assists.**
6. **Show the top 3 goal scorers along with their team names.**
7. **Find teams that have never won a match.**
8. **Retrieve the number of goals scored by each team in all matches.**
9. **Show all players who have scored at least one penalty.**
10. **Retrieve all teams and the count of matches they have played.**
11. **List players who have scored an own goal.**
12. **Find the match with the highest total goals scored.**
13. **Show all players who haven't scored a goal yet.**
14. **Retrieve teams along with the total number of goals scored by their players.**
15. **Find the player with the highest goal contribution (goals + assists).**
16. **List all players who have scored more than the average number of goals.**
17. **Retrieve the top 3 stadiums where the most goals have been scored.**
18. **Show the number of matches each team has played as home and away teams.**
19. **Find players who have scored in multiple match types (Open Play, Penalty, Own Goal).**
20. **Retrieve the team with the highest average goals per match.**

## Files

- **schema.sql**: Contains the SQL schema for creating the database tables.
- **data.sql**: Contains sample SQL queries to retrieve data from the database.
- **queries.sql**: Contains additional SQL queries for data retrieval.

## Usage

1. **Set up the database**: Run the `schema.sql` file to create the necessary tables in your database.
2. **Insert data**: Populate the tables with relevant data.
3. **Run queries**: Use the queries provided in `data.sql` and `queries.sql` to retrieve insights from the database.
