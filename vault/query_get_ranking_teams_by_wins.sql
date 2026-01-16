-- Ranking of teams by wins in a specific season.

SELECT 
    t.name AS equipo,
    SUM(CASE WHEN r.result = 'H' AND r.home_id = t.id THEN 1 ELSE 0 END) AS victorias_local,
    SUM(CASE WHEN r.result = 'A' AND r.away_id = t.id THEN 1 ELSE 0 END) AS victorias_visitante,
    SUM(CASE 
            WHEN (r.result = 'H' AND r.home_id = t.id) OR (r.result = 'A' AND r.away_id = t.id)
            THEN 1 ELSE 0 
        END) AS victorias_totales
FROM Results r
JOIN Teams t ON t.id = r.home_id OR t.id = r.away_id
	WHERE r.season_id = (SELECT id FROM Seasons WHERE year = '2025-2026')
    GROUP BY t.name	
    ORDER BY victorias_totales DESC;
