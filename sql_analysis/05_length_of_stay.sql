-- ============================================
-- 05_length_of_stay.sql
-- Length of stay analysis by completion status
-- ============================================

SELECT
    CASE completed
        WHEN 1 THEN 'Completed'
        WHEN 0 THEN 'Not Completed'
    END AS completion_status,
    COUNT(*) AS total_episodes,
    ROUND(AVG(los), 1) AS mean_los,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY los) AS median_los,
    MIN(los) AS min_los,
    MAX(los) AS max_los
FROM teds_discharges
GROUP BY completed
ORDER BY completed DESC;