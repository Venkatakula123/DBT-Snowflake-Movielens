{{
    config(
        materialized='table',
        schema = 'dim',
        pre_hook = ["INSERT INTO movielens.audit.model_runs (model_name, run_type, run_timestamp) VALUES ('{{ this }}', 'start', CURRENT_TIMESTAMP)"],
        post_hook = ["INSERT INTO movielens.audit.model_runs (model_name, run_type, run_timestamp) VALUES ('{{ this }}', 'end', CURRENT_TIMESTAMP)"]
    )
}}
WITH ratings AS (
  SELECT DISTINCT user_id FROM {{ ref('src_ratings') }}
),

tags AS (
  SELECT DISTINCT user_id FROM {{ ref('src_tags') }}
)

SELECT DISTINCT user_id
FROM (
  SELECT * FROM ratings
  UNION
  SELECT * FROM tags
)