select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select fear_greed_index
from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_sentiment_analysis
where fear_greed_index is null



      
    ) dbt_internal_test