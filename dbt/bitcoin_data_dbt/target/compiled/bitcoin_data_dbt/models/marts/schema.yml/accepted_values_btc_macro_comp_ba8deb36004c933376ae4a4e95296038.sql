
    
    

with all_values as (

    select
        btc_vs_gold as value_field,
        count(*) as n_records

    from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
    group by btc_vs_gold

)

select *
from all_values
where value_field not in (
    'BTC Outperformed Gold','BTC Underperformed Gold'
)


