WITH dim_listings AS(
    SELECT * FROM {{ ref('src_listing') }}
)
SELECT
    listing_id,
    listing_url,
    listing_name,
    room_type,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(price_str, '$') :: NUMBER(10,2) AS price,
    created_at,
    updated_at
FROM
    dim_listings