WITH GENOME_TAGS_RAW AS (
    SELECT * FROM {{source('movies','RAW_GENOME_TAGS')}}
)

SELECT 
    tagId as tag_id,
    tag
FROM GENOME_TAGS_RAW
