-- Check how many games have been loaded for a specific season.

SELECT 
	s.year,
	COUNT(*) AS total_matches
FROM Results r
JOIN Seasons s ON r.season_id = s.id
	WHERE s.year = '2025-2026' 
    AND competition_code = "UCL";
