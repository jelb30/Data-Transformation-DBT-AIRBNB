select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select listing_id
from AIRBNB.DEV.dim_listings_cleansed
where listing_id is null



      
    ) dbt_internal_test