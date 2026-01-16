-- Obtain the history of matches between two teams.

SELECT 
	*
FROM Results 
WHERE (home_id = (SELECT id FROM Teams WHERE name = 'Real Madrid') 
	AND away_id = (SELECT id FROM Teams WHERE name = 'Espanyol'))
    OR (home_id = (SELECT id FROM Teams WHERE name = 'Espanyol') 
    AND away_id = (SELECT id FROM Teams WHERE name = 'Real Madrid'))
    ORDER BY id ASC;
