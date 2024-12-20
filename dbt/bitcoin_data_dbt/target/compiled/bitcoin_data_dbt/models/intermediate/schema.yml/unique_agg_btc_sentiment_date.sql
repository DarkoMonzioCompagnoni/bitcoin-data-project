
    
    

select
    date as unique_field,
    count(*) as n_records

from BTC_PROJECT_SILVER.DMC_DMC.agg_btc_sentiment
where date is not null
group by date
having count(*) > 1


