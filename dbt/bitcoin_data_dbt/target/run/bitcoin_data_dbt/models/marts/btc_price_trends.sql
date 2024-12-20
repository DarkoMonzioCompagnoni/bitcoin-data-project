
  
    

        create or replace transient table BTC_PROJECT_GOLD.DMC_PUBLIC.btc_price_trends
         as
        (-- Insight: Provides daily changes in Bitcoin price and identifies trends.

WITH price_trends AS (
    SELECT
        date,
        btc_price,
        LAG(btc_price) OVER (ORDER BY date) AS previous_price,
        btc_price - LAG(btc_price) OVER (ORDER BY date) AS daily_change,
        (btc_price - LAG(btc_price) OVER (ORDER BY date)) / LAG(btc_price) OVER (ORDER BY date) * 100 AS daily_change_pct
    FROM BTC_PROJECT_SILVER.DMC_DMC.agg_btc_macro  -- Using BTC price from agg_btc_macro
)

SELECT
    date,
    btc_price,
    previous_price,
    daily_change,
    daily_change_pct,
    CASE
        WHEN daily_change_pct > 0 THEN 'Increase'
        WHEN daily_change_pct < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS trend
FROM price_trends
        );
      
  