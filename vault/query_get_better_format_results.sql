-- Get match results in a more attractive and comprehensive format.

SELECT 
    R.id AS 'Id',
    R.codification AS 'Match',
    S.year AS 'Season',
    R.date AS 'Date',
    R.round AS 'Round', 
    HomeTeam.name AS 'Home', 
    AwayTeam.name AS 'Away', 
    R.Result AS 'Result',
    R.home_goals_full_time AS 'Home Goals',
    R.away_goals_full_time AS 'Away Goals',
    R.home_possession AS 'Home Possession',
    R.away_possession AS 'Away Possession',
    R.home_shots AS 'Home Shots',
    R.away_shots AS 'Away Shots',
    R.home_shots_on_target AS 'Home Shots On Target',
    R.away_shots_on_target AS 'Away Shots On Target',
    R.home_fouls AS 'Home Fouls',
    R.away_fouls AS 'Away Fouls',
    R.home_yellow_cards AS 'Home Yellow Cards',
    R.away_yellow_cards AS 'Away Yellow Cards',
    R.home_red_cards AS 'Home Red Cards',
    R.away_red_cards AS 'Away Red Cards',
    R.home_corners AS 'Home Corners',
    R.away_corners AS 'Away Corners',
    R.home_offsides AS 'Home Offsides',
    R.away_offsides AS 'Away Offsides'
FROM Results R
JOIN Seasons S ON S.id = R.season_id
JOIN Teams AS HomeTeam ON HomeTeam.id = R.home_id
JOIN Teams AS AwayTeam ON AwayTeam.id = R.away_id;
