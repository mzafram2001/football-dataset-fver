-- Get the games for a specific team (either home or away).

SELECT 
	*
FROM Results 
	WHERE home_id = (SELECT id FROM Teams WHERE name = 'Real Madrid') 
	OR away_id = (SELECT id FROM Teams WHERE name = 'Real Madrid');
   