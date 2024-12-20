select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select classification
from BTC_PROJECT_SILVER.DMC_DMC.agg_btc_sentiment
where classification is null



      
    ) dbt_internal_test