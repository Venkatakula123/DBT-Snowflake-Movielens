WITH RAW_MOVIES AS (
    SELECT * FROM {{source('movies','RAW_MOVIES')}} 
)
SELECT 
    movieID as Movie_ID,
    title as Title,
    genres as Genre,
FROM RAW_MOVIES
    