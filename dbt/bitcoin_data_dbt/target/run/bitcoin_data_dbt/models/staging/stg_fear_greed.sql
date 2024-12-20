
  create or replace   view BTC_PROJECT_SILVER.DMC.stg_fear_greed
  
   as (
    WITH source AS (
    SELECT
        JSON_DATA:data AS data_array
    FROM BTC_PROJECT_BRONZE.FEAR_GREED_INGESTION.FEAR_GREED_RAW
),

flattened AS (
    SELECT
        value:"value"::INT AS fear_greed_value,
        value:"value_classification"::STRING AS classification,
        TO_TIMESTAMP_NTZ(value:"timestamp"::INT) AS date
    FROM source,
    LATERAL FLATTEN(input => data_array)
)

SELECT
    date,
    fear_greed_value,
    classification
FROM flattened
  );

