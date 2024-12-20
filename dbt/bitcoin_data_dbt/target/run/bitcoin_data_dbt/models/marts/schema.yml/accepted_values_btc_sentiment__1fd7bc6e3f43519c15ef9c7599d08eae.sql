select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        classification as value_field,
        count(*) as n_records

    from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_sentiment_analysis
    group by classification

)

select *
from all_values
where value_field not in (
    'Extreme Fear','Fear','Neutral','Greed','Extreme Greed'
)



      
    ) dbt_internal_test