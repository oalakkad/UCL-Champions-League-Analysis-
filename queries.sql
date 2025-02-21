-- Displaying all tables:
SELECT * FROM goals;
SELECT * FROM matches;
SELECT * FROM players;
SELECT * FROM teams;





-- 1. Retrieve all players who have scored more than 5 goals. 



-- SELECT 
-- ps.player_id,
-- player_name,
-- goals_scored
-- FROM players ps
-- INNER JOIN goals gs
-- ON ps.player_id = gs.player_id
-- WHERE goals_scored > 5;











-- 2. Find the teams that have scored more goals at home than away. 

-- WITH matches AS (
-- 	SELECT 
-- 	team_id,
-- 	team_name,
-- 	home_goals,
-- 	away_goals
-- 	FROM teams AS ts
-- 	INNER JOIN matches AS ms
-- 	ON ts.team_id = ms.home_team_id
-- )

-- SELECT * FROM matches
-- WHERE home_goals > away_goals;






-- 3. Show all matches where the home team scored 3 or more goals. 



-- WITH goal_scored AS (
-- 	SELECT 
-- 	ms.match_id,
-- 	team_name,
-- 	home_goals,
-- 	away_goals
-- 	FROM matches AS ms
-- 	INNER JOIN teams AS ts
-- 	ON ts.team_id = ms.home_team_id
-- 	INNER JOIN goals AS gs
-- 	ON ms.match_id = gs.match_id
-- )

-- SELECT * FROM goal_scored
-- WHERE home_goals >= 3;








-- 4. List players with NULL values in the assists column. 



-- SELECT * FROM players
-- WHERE assists IS NULL;











-- 5. Retrieve all teams that have at least one player with more than 10 assists. 


-- SELECT * 
-- FROM teams AS ts
-- INNER JOIN players AS ps 
-- ON ts.team_id = ps.team_id
-- WHERE assists >= 10;













-- 6. Show the top 3 goal scorers along with their team names.


-- WITH rank_players AS (
-- 	SELECT 
-- 	player_name,
-- 	team_name,
-- 	goals_scored,
-- 	ROW_NUMBER() OVER(ORDER BY goals_scored DESC) AS ranking
-- 	FROM players AS ps
-- 	INNER JOIN teams AS ts
-- 	ON ps.team_id = ts.team_id
-- )

-- SELECT 
-- player_name,
-- team_name,
-- goals_scored
-- FROM rank_players
-- WHERE ranking IN (1,2,3)










-- 7. Find the teams that have never won a match. 


-- SELECT ts.team_name
-- FROM teams AS ts
-- LEFT JOIN matches AS ms_home 
--     ON ts.team_id = ms_home.home_team_id AND ms_home.home_goals > ms_home.away_goals
-- LEFT JOIN matches AS ms_away 
--     ON ts.team_id = ms_away.away_team_id AND ms_away.away_goals > ms_away.home_goals
-- WHERE ms_home.match_id IS NULL AND ms_away.match_id IS NULL;







-- 8. Retrieve the number of goals scored by each team in all 
-- matches. 



-- SELECT 
--     ts.team_name,
--     COALESCE(SUM(CASE 
--                     WHEN ts.team_id = ms.home_team_id THEN ms.home_goals
--                     WHEN ts.team_id = ms.away_team_id THEN ms.away_goals
--                  END), 0) AS total_goals
-- FROM teams AS ts
-- LEFT JOIN matches AS ms 
--     ON ts.team_id = ms.home_team_id OR ts.team_id = ms.away_team_id
-- GROUP BY ts.team_name;









-- 9. Show all players who have scored at least one penalty. 




-- SELECT 
-- player_name,
-- goal_type
-- FROM players AS ps
-- INNER JOIN goals AS gs
-- ON ps.player_id = gs.player_id
-- WHERE goal_type = 'Penalty'
-- AND goals_scored >= 1








-- 10. Retrieve all teams and the count of matches they have played. 


-- SELECT 
-- team_name,
-- COUNT(*) AS total_played
-- FROM teams AS ts
-- INNER JOIN matches AS ms
-- ON ts.team_id = ms.home_team_id
-- OR ts.team_id = ms.away_team_id
-- GROUP BY team_name






-- 11. List players who have scored an own goal. 



-- SELECT 
-- player_name
-- FROM players AS ps
-- INNER JOIN goals AS gs
-- ON ps.player_id = gs.player_id
-- WHERE goal_type = 'Own Goal'








-- 12. Find the match with the highest total goals scored.


-- WITH total_goals AS (
-- 	SELECT 
-- 	match_id,
-- 	stadium,
-- 	SUM(home_goals + away_goals) OVER(PARTITION BY match_id) AS total_goals_scored
-- 	FROM matches
-- )

-- SELECT * 
-- FROM total_goals
-- WHERE total_goals_scored = (
-- SELECT MAX(total_goals_scored) FROM total_goals
-- )







-- 13. Show all players who haven't scored a goal yet. 






-- SELECT 
-- *
-- FROM players AS ps
-- LEFT JOIN goals AS gs
-- ON ps.player_id = gs.player_id
-- WHERE goals_scored IS NULL
-- OR goals_scored = 0













-- 14. Retrieve teams along with the total number of goals scored by 
-- their players. 




-- SELECT  
-- team_name,
-- SUM(goals_scored) AS total_goals
-- FROM teams AS ts
-- INNER JOIN players AS ps
-- ON ts.team_id = ps.team_id
-- GROUP BY team_name









-- 15. Find the player with the highest goal contribution (goals + 
-- assists). 



-- WITH total_ga AS (
-- 	SELECT
-- 	player_name,
-- 	goals_scored,
-- 	COALESCE(assists,0) AS assists,
-- 	(COALESCE(assists,0) + COALESCE(goals_scored,0)) AS ga
-- 	FROM players
-- ),
-- goals_assists AS (
-- 	SELECT 
-- 	*,
-- 	DENSE_RANK() OVER(ORDER BY ga DESC) AS ranking
-- 	FROM total_ga

-- )




-- SELECT *
-- FROM goals_assists
-- WHERE ranking = 1;





-- 16. List all players who have scored more than the average number 
-- of goals. 





-- SELECT 
-- player_name,
-- goals_scored
-- FROM players
-- WHERE goals_scored > (
-- 	SELECT ROUND(AVG(goals_scored)) AS avg_goals
-- 	FROM players
-- )










-- 17. Retrieve the top 3 stadiums where the most goals have been 
-- scored. 



-- SELECT 
-- stadium,
-- home_goals
-- FROM matches
-- ORDER BY home_goals DESC
-- LIMIT 3;









-- 18. Show the number of matches each team has played as home 
-- and away teams. 



-- SELECT 
--     ts.team_name,
--     COUNT(CASE WHEN ms.home_team_id = ts.team_id THEN 1 END) AS home_matches,
--     COUNT(CASE WHEN ms.away_team_id = ts.team_id THEN 1 END) AS away_matches
-- FROM teams AS ts
-- LEFT JOIN matches AS ms 
-- ON ts.team_id = ms.home_team_id OR ts.team_id = ms.away_team_id
-- GROUP BY ts.team_name;





-- 19. Find players who have scored in multiple match types (Open Play, Penalty, Own Goal). 



-- SELECT 
--     ps.player_name
-- FROM players AS ps
-- INNER JOIN goals AS gs 
-- ON ps.player_id = gs.player_id
-- WHERE gs.goal_type IN ('Open Play', 'Penalty', 'Own Goal')
-- GROUP BY ps.player_name
-- HAVING COUNT(DISTINCT gs.goal_type) > 1














-- 20. Retrieve the team with the highest average goals per match.


-- WITH avg_scored AS (
-- 	SELECT  
-- 	team_name,
-- 	ROUND(AVG(home_goals + away_goals)) AS avg_goals
-- 	FROM teams AS ts
-- 	INNER JOIN matches AS ms
-- 	ON ts.team_id = ms.home_team_id
-- 	GROUP BY team_name
-- 	ORDER BY ROUND(AVG(home_goals + away_goals)) DESC

-- )


-- SELECT * FROM avg_scored
-- LIMIT 1;







