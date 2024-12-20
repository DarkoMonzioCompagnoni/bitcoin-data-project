WITH ranked_rows AS (
    SELECT
        TO_DATE(TO_TIMESTAMP_NTZ(timestamp_raw::INT / 1000)) AS date,  -- Convert timestamp to DATE
        price_usd::FLOAT AS price_usd,
        market_cap_usd::FLOAT AS market_cap_usd,
        total_volume_usd::FLOAT AS total_volume_usd,
        ROW_NUMBER() OVER (PARTITION BY TO_DATE(TO_TIMESTAMP_NTZ(timestamp_raw::INT / 1000)) ORDER BY timestamp_raw DESC) AS row_num
    FROM BTC_PROJECT_BRONZE.MARKET_DATA.BTC_HISTORICAL_RAW
)

SELECT
    date,
    price_usd,
    market_cap_usd,
    total_volume_usd
FROM ranked_rows
WHERE row_num = 1 -- Keeps only the latest row for each dateclear