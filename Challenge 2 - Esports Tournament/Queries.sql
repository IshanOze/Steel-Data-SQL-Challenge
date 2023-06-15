-- What are the names of the players whose salary is greater than 100,000?

select player_name
from players
where salary >= 100000;

-- What is the team name of the player with player_id = 3?

select player_id, team_name
from players, teams
where players.team_id = teams.team_id and player_id = 3;

-- What is the total number of players in each team?

select team_name, count(player_id) as no_of_players 
from players, teams
where players.team_id = teams.team_id
group by team_name;

-- What is the team name and captain name of the team with team_id = 2?

select team_name, player_name
from teams, players
where players.team_id = teams.team_id and player_id = captain_id;

-- What are the player names and their roles in the team with team_id = 1?

select player_name, role
from players, teams
where teams.team_id = players.team_id and teams.team_id=1;

-- What are the team names and the number of matches they have won?
select team_name, count(winner_id) as matchees_won
from teams, matches
where matches.winner_id = teams.team_id
group by team_name;

-- What is the average salary of players in the teams with country 'USA'?
select team_name, avg(salary) as avg_salary
from teams, players
where teams.team_id = players.team_id and country='USA'
group by team_name;

-- Which team won the most matches?

select team_name, count(winner_id) as matches_won
from teams, matches
where matches.winner_id = teams.team_id
group by team_name
order by matches_won desc limit 1;

-- What are the team names and the number of players in each team whose salary is greater than 100,000?

select team_name, count(player_id) as salary_grtr_100000
from teams, players
where players.team_id = teams.team_id and salary >= 100000
group by team_name;

-- What is the date and the score of the match with match_id = 3?

select match_date, score_team1, score_team2
from matches
where match_id = 3;
