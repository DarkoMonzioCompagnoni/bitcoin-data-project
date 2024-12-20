
    
    

select
    date as unique_field,
    count(*) as n_records

from BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
where date is not null
group by date
having count(*) > 1


