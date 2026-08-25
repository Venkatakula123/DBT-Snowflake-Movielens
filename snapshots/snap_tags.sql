{% snapshot snap_tags %}

{{
    config(
        target_schema = 'snapshots',
        unique_key = ['user_id','movie_id','tag'],
        strategy = 'timestamp',
        updated_at = 'tag_timestamp',
        invalidate_hard_deleted = True
    )
}}

SELECT
{{ dbt_utils.generate_surrogate_key(['user_id','movie_id','tag']) }} AS row_key,
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp as TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ref('src_tags')}}

{% endsnapshot %}

--This snapshot can be tested by UPDATING the src_tags table. When the src table is updated, run dbt snapshot and check the snapshot, it will record the a new row with the updates.

--SELECT * FROM SNAP_TAGS
--WHERE USER_ID = 18;

--UPDATE src_tags
--SET TAG = 'Mark Waters fire air', tag_timestamp = CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ)
--WHERE USER_ID = 18;

--SELECT * FROM DEV.SRC_TAGS
--WHERE USER_ID = 18;