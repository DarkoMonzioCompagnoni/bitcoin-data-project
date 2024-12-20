select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select btc_price
from BTC_PROJECT_SILVER.DMC_DMC.agg_btc_macro
where btc_price is null



      
    ) dbt_internal_test