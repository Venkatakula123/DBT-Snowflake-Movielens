{{
    config(
        materialized='table',
        schema = 'dim',
        pre_hook = [log_start_time(this)],
        post_hook = [log_end_time(this)]
    )
}}
WITH src_movies AS (
    SELECT * FROM {{ ref('src_movies') }}
)
SELECT
    movie_id,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(Genre, '|') AS genre_array,
    Genre
FROM src_movies