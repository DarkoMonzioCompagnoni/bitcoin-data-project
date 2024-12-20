select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        trend as value_field,
        count(*) as n_records

    from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_price_trends
    group by trend

)

select *
from all_values
where value_field not in (
    'Increase','Decrease','No Change'
)



      
    ) dbt_internal_test