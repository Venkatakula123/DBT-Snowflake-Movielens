{% macro log_start_time(model_ref)%}
INSERT INTO movielens.audit.model_runs (model_name, run_type, run_timestamp) VALUES ('{{ model_ref }}', 'start', CURRENT_TIMESTAMP)
{% endmacro %}

{%macro log_end_time(model_ref)%}
INSERT INTO audit.model_runs (model_name, run_type, run_timestamp) VALUES ('{{ model_ref }}', 'end', CURRENT_TIMESTAMP)
{%endmacro%}