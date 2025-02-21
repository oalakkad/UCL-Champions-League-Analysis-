
INSERT INTO Teams (team_name, country, coach) VALUES 
('Real Madrid', 'Spain', 'Carlo Ancelotti'), 
('Manchester City', 'England', 'Pep Guardiola'), 
('Bayern Munich', 'Germany', 'Thomas Tuchel'), 
('Barcelona', 'Spain', 'Xavi Hernandez'), 
('Liverpool', 'England', 'Jurgen Klopp'), 
('Paris Saint-Germain', 'France', 'Luis Enrique'), 
('Juventus', 'Italy', 'Massimiliano Allegri'), 
('AC Milan', 'Italy', 'Stefano Pioli'), 
('Chelsea', 'England', 'Mauricio Pochettino'), 
('Inter Milan', 'Italy', 'Simone Inzaghi'), 
('Atletico Madrid', 'Spain', 'Diego Simeone'), 
('Borussia Dortmund', 'Germany', 'Edin Terzic'), 
('Napoli', 'Italy', 'Walter Mazzarri'), 
('Arsenal', 'England', 'Mikel Arteta'), 
('Benfica', 'Portugal', 'Roger Schmidt'); 


INSERT INTO Players (player_name, team_id, position, 
goals_scored, assists) VALUES 
('Karim Benzema', 1, 'Forward', 27, 10), 
('Kevin De Bruyne', 2, 'Midfielder', 15, 20), 
('Robert Lewandowski', 3, 'Forward', 30, 5), 
('Pedri', 4, 'Midfielder', 5, 12), 
('Mohamed Salah', 5, 'Forward', 25, 8), 
('Kylian Mbappe', 6, 'Forward', 35, 6), 
('Angel Di Maria', 7, 'Midfielder', 10, NULL), 
('Olivier Giroud', 8, 'Forward', 12, 3), 
('Raheem Sterling', 9, 'Forward', 18, 7), 
('Lautaro Martinez', 10, 'Forward', 20, NULL), 
('Joao Felix', 11, 'Forward', 14, 5), 
('Jude Bellingham', 12, 'Midfielder', 8, 10), 
('Victor Osimhen', 13, 'Forward', 22, 4), 
('Bukayo Saka', 14, 'Winger', 14, 15), 
('Joao Mario', 15, 'Midfielder', 9, 8); 



INSERT INTO Matches (home_team_id, away_team_id, 
home_goals, away_goals, stadium) VALUES 
(1, 2, 3, 1, 'Santiago Bernabeu'), 
(3, 4, 2, 2, 'Allianz Arena'), 
(5, 6, 1, 2, 'Anfield'), 
(7, 8, 0, 1, 'Juventus Stadium'), 
(9, 10, 2, 3, 'Stamford Bridge'), 
(11, 12, 1, 1, 'Wanda Metropolitano'), 
(13, 14, 4, 0, 'Stadio Diego Maradona'), 
(15, 1, 1, 5, 'Estadio da Luz'), 
(2, 3, 2, 1, 'Etihad Stadium'), 
(4, 5, 0, 2, 'Camp Nou'), 
(6, 7, 3, 2, 'Parc des Princes'), 
(8, 9, 1, 1, 'San Siro'), 
(10, 11, 2, 4, 'Giuseppe Meazza'), 
(12, 13, 0, 3, 'Signal Iduna Park'), 
(14, 15, 1, 2, 'Emirates Stadium'); 


INSERT INTO Goals (match_id, player_id, team_id, goal_type) 
VALUES 
(1, 1, 1, 'Open Play'), 
(2, 3, 3, 'Penalty'), 
(3, 5, 5, 'Open Play'), 
(4, NULL, 8, 'Own Goal'), 
(5, 9, 9, 'Open Play'), 
(6, 11, 11, 'Open Play'), 
(7, 13, 13, 'Open Play'), 
(8, 15, 15, 'Penalty'), 
(9, 2, 2, 'Open Play'), 
(10, 4, 4, 'Open Play'), 
(11, 6, 6, 'Penalty'), 
(12, 8, 8, 'Own Goal'), 
(13, 10, 10, 'Open Play'), 
(14, 12, 12, 'Open Play'), 
(15, NULL, 14, 'Own Goal');