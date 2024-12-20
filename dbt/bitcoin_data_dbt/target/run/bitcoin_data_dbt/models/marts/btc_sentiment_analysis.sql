
  
    

        create or replace transient table BTC_PROJECT_GOLD.DMC_PUBLIC.btc_sentiment_analysis
         as
        (-- Insight: Analyzes how sentiment (Fear & Greed Index) correlates with Bitcoin price.

WITH sentiment_analysis AS (
    SELECT
        date,
        price_usd,
        fear_greed_value,
        classification,
        CORR(price_usd, fear_greed_value) OVER () AS correlation
    FROM BTC_PROJECT_SILVER.DMC_DMC.agg_btc_sentiment  -- Joining BTC price with sentiment data
)

SELECT
    date,
    price_usd,
    fear_greed_value,
    classification,
    correlation
FROM sentiment_analysis
ORDER BY date
        );
      
  