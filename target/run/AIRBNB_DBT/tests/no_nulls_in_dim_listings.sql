select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    SELECT * FROM AIRBNB.DEV.dim_listings_cleansed WHERE
    LISTING_ID IS NULL OR
    LISTING_URL IS NULL OR
    LISTING_NAME IS NULL OR
    ROOM_TYPE IS NULL OR
    MINIMUM_NIGHTS IS NULL OR
    HOST_ID IS NULL OR
    PRICE IS NULL OR
    CREATED_AT IS NULL OR
    UPDATED_AT IS NULL OR
    
    FALSE

      
    ) dbt_internal_test