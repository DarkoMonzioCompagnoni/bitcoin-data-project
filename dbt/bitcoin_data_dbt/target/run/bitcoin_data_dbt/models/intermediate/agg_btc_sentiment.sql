
  
    

        create or replace transient table BTC_PROJECT_SILVER.DMC_DMC.agg_btc_sentiment
         as
        (WITH sentiment_data AS (
    SELECT
        b.date,
        b.price_usd,
        f.fear_greed_value,
        f.classification
    FROM BTC_PROJECT_SILVER.DMC.stg_btc_historical b
    LEFT JOIN BTC_PROJECT_SILVER.DMC.stg_fear_greed f
    ON b.date = f.date
)

SELECT
    date,
    price_usd,
    fear_greed_value,
    classification
FROM sentiment_data
        );
      
  