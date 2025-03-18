SELECT candidate_id FROM candidates
WHERE skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING count(DISTINCT skill) = 3
ORDER BY candidate_id ASC;