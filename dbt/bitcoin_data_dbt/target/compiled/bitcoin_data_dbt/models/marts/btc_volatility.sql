-- Ranks the most volatile days in Bitcoin's price history

WITH volatility_data AS (
    SELECT
        date,
        btc_price,
        ABS(btc_price - LAG(btc_price) OVER (ORDER BY date)) AS absolute_change,
        (ABS(btc_price - LAG(btc_price) OVER (ORDER BY date)) / btc_price) * 100 AS volatility_pct
    FROM BTC_PROJECT_SILVER.DMC_DMC.agg_btc_macro
)

SELECT
    date,
    btc_price,
    absolute_change,
    volatility_pct,
    RANK() OVER (ORDER BY volatility_pct DESC) AS volatility_rank
FROM volatility_data