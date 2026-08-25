{{
  config(
    materialized = 'incremental',
    on_schema_change='fail' ,
    schema = 'fact'
  )
}} 

WITH src_ratings AS (
  SELECT * FROM {{ ref('src_ratings') }}
)

SELECT
  user_id,
  movie_id,
  rating,
  rating_timestamp
FROM src_ratings
WHERE rating IS NOT NULL

{% if is_incremental() %}
  AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %} 
--If condition is met, where the rating_timestamp is greater than the current MAX timestamp from the src_ratings, then it will update our fct_ratings table. 
--This can be tested if we INSERT a new row into our src_ratings table (Configure to table if still view) where timestamp is greater than the current MAX timestamp.
--{{ config(materialized = 'table')}} 