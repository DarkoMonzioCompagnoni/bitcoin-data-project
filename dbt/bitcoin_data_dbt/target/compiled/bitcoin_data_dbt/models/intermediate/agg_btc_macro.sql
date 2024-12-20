WITH macro_data AS (
    SELECT
        b.date,
        b.price_usd AS btc_price,
        g.close_price AS gold_price,
        s.close_price AS sp500_price
    FROM BTC_PROJECT_SILVER.DMC.stg_btc_historical b
    LEFT JOIN BTC_PROJECT_SILVER.DMC.stg_gold g
        ON b.date = g.date
    LEFT JOIN BTC_PROJECT_SILVER.DMC.stg_sp500 s
        ON b.date = s.date

)

SELECT
    date,
    btc_price,
    sp500_price,
    gold_price
FROM macro_data