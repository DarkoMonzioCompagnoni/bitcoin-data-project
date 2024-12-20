select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sp500_price
from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
where sp500_price is null



      
    ) dbt_internal_test