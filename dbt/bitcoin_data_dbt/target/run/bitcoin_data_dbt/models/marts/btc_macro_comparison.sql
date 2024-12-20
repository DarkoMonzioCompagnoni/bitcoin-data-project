
  
    

        create or replace transient table BTC_PROJECT_GOLD.DMC_PUBLIC.btc_macro_comparison
         as
        (-- Insight: Compares Bitcoin’s performance with traditional markets (gold and S&P 500).

WITH macro_comparison AS (
    SELECT
        date,
        btc_price,
        sp500_price,
        gold_price,
        (btc_price - LAG(btc_price) OVER (ORDER BY date)) / LAG(btc_price) OVER (ORDER BY date) * 100 AS btc_daily_change_pct,
        (sp500_price - LAG(sp500_price) OVER (ORDER BY date)) / LAG(sp500_price) OVER (ORDER BY date) * 100 AS sp500_daily_change_pct,
        (gold_price - LAG(gold_price) OVER (ORDER BY date)) / LAG(gold_price) OVER (ORDER BY date) * 100 AS gold_daily_change_pct
    FROM BTC_PROJECT_SILVER.DMC_DMC.agg_btc_macro  -- Using BTC, S&P 500, and gold data
)

SELECT
    date,
    btc_price,
    sp500_price,
    gold_price,
    btc_daily_change_pct,
    sp500_daily_change_pct,
    gold_daily_change_pct,
    CASE
        WHEN btc_daily_change_pct > sp500_daily_change_pct THEN 'BTC Outperformed SP500'
        ELSE 'BTC Underperformed SP500'
    END AS btc_vs_sp500,
    CASE
        WHEN btc_daily_change_pct > gold_daily_change_pct THEN 'BTC Outperformed Gold'
        ELSE 'BTC Underperformed Gold'
    END AS btc_vs_gold
FROM macro_comparison
        );
      
  