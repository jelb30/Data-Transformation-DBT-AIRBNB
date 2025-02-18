{% macro demo_logging() %}

  {% set demo_var = "Demo" %}
  {{ log(demo_var ~ ' logging is happening', info=True) }}
  
{% endmacro %}