select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select date
from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
where date is null



      
    ) dbt_internal_test