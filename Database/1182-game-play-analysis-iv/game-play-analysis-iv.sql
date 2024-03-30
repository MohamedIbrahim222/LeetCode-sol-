WITH cte AS (
    SELECT
        player_id,
        DATEDIFF(event_date, MIN(event_date) OVER (PARTITION BY player_id)) = 1 AS login
    FROM
        Activity
)
SELECT
    ROUND(SUM(login) * 1.0 / COUNT(DISTINCT player_id), 2) AS fraction
FROM
    cte;