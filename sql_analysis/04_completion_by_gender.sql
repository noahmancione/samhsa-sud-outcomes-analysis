-- ============================================
-- 04_completion_by_gender.sql
-- Treatment completion rates by gender
-- ============================================

SELECT
    sex AS gender,
    COUNT(*) AS total_episodes,
    SUM(completed) AS total_completed,
    ROUND(AVG(completed) * 100, 1) AS completion_rate_pct
FROM teds_discharges
WHERE sex IS NOT NULL
GROUP BY sex
ORDER BY completion_rate_pct DESC;