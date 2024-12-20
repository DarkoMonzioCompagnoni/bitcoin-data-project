select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        btc_vs_sp500 as value_field,
        count(*) as n_records

    from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
    group by btc_vs_sp500

)

select *
from all_values
where value_field not in (
    'BTC Outperformed SP500','BTC Underperformed SP500'
)



      
    ) dbt_internal_test