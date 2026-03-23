WITH SONGS AS (
    SELECT * FROM {{ ref('stg_spotify_songs') }}
)

SELECT
    CASE
        WHEN ranking_position <= 10 THEN 'Top 10'
        ELSE 'Top 11-50'
    END AS POSITION,
    ROUND(AVG(bpm), 3) AS AVERAGE_BPM,
    ROUND(AVG(danceability), 3) AS AVERAGE_DANCEABILITY,
    ROUND(AVG(energy), 3) AS AVERAGE_ENERGY,
    ROUND(AVG(valence), 3) AS AVERAGE_VALENCE,
    ROUND(AVG(acousticness), 3) AS AVERAGE_ACOUSTICNESS
FROM SONGS
GROUP BY POSITION
