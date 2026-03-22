WITH ARTISTS AS (
    SELECT * FROM {{ ref('stg_spotify_artists') }}
)

SELECT
    artist_country,
    COUNT(artist_name) AS total_top_artists,
    SUM(monthly_listeners_millions) AS total_monthly_listeners_millions,
    SUM(grammy_wins) AS total_grammys
FROM ARTISTS
GROUP BY artist_country
ORDER BY total_top_artists
