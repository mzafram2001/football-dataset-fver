-- Get the games for a specific season.

SELECT 
	* 
FROM Results R
JOIN Seasons S ON S.id = R.season_id
	WHERE S.year = '2025-2026';
