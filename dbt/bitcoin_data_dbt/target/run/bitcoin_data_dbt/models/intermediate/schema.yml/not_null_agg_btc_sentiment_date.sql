select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select date
from BTC_PROJECT_SILVER.DMC_DMC.agg_btc_sentiment
where date is null



      
    ) dbt_internal_test