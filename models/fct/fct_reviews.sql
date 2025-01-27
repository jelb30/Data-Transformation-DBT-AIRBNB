{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}

WITH src_reviews AS(
    SELECT * FROM {{ ref('src_reviews') }}
)

SELECT
 {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} AS review_id,
 * 
FROM 
  src_reviews as r
WHERE r.review_text IS NOT NULL
{% if is_incremental() %}
  {% if var("start_date", False) and var("end_date", False) %}

    {{ log("Loading " ~ this ~ "incrementally (start_date " ~ var("start_date") ~ ", end_date: "~ var("end_date"), info=True) }}
    AND r.review_date >= '{{ var('start_date') }}'
    AND r.review_date <= '{{ var('end_date') }}'

  {% else %}

    {{ log("Loading "~ this ~ "incrementaly (all missing dates)", info=True) }}
    AND r.review_date > (select max(review_date) from {{ this }})

  {% endif %}
{% endif %}