{% macro rename_columns(relation) %}
    {% set cols = adapter.get_columns_in_relation(relation) %}
    {%- for col in cols -%}
        `{{ col.name }}` AS {{ col.name | replace(' ', '_') | lower }}{% if not loop.last %}, {% endif %}
    {%- endfor -%}
{% endmacro %}


