{% macro rename_columns(model) %}
    {% set columns = adapter.get_columns_in_relation(model) %}
    
    {% for col in columns %}
        {{ col.name }} as {{ col.name | replace(' ', '_') }}{% if not loop.last %}, {% endif %}
    {% endfor %}
{% endmacro %}
