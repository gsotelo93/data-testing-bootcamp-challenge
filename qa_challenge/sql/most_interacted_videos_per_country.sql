with _interactions as (
    SELECT 
        country_code,
        video_id,
        SUM(interaction_events) AS total_interactions
    FROM viewership_data
    GROUP by 1, 2
    HAVING SUM(interaction_events) >= 150
), _ranking AS (
    SELECT
        country_code,
        video_id,
        total_interactions,
        ROW_NUMBER() OVER (PARTITION BY country_code ORDER BY total_interactions DESC) AS rank
    FROM _interactions
)
SELECT 
    country_code,
    video_id,
    total_interactions
FROM _ranking
WHERE rank = 1
ORDER BY country_code

