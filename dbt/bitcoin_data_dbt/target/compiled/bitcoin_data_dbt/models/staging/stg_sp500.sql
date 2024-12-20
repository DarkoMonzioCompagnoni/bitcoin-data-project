WITH source AS (
    SELECT
        JSON_DATA:"Time Series (Daily)" AS time_series
    FROM BTC_PROJECT_BRONZE.MACRO_DATA.ALPHA_VANTAGE_SP500_RAW
),

flattened AS (
    SELECT
        TO_DATE(key) AS date,
        value:"1. open"::FLOAT AS open_price,
        value:"2. high"::FLOAT AS high_price,
        value:"3. low"::FLOAT AS low_price,
        value:"4. close"::FLOAT AS close_price,
        value:"5. volume"::FLOAT AS volume
    FROM source,
    LATERAL FLATTEN(input => time_series)
)

SELECT
    date,
    open_price,
    high_price,
    low_price,
    close_price,
    volume
FROM flattened