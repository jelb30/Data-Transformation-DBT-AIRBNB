
  create or replace   view AIRBNB.DEV.dim_listings_cleansed
  
   as (
    WITH  __dbt__cte__src_listing as (
WITH raw_listings AS(
    SELECT * FROM AIRBNB.raw.raw_listings
)
SELECT
    id AS listing_id,
    listing_url,
    name AS listing_name,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings
), dim_listings AS(
    SELECT * FROM __dbt__cte__src_listing
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
  );

