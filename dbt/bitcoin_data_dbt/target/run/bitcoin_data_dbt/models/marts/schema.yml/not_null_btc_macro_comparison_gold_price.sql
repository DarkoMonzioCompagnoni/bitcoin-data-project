select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select gold_price
from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
where gold_price is null



      
    ) dbt_internal_test