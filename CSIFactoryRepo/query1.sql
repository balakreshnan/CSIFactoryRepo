-- This is auto-generated code
SELECT TOP 100
    jsonContent
/* --> place the keys that you see in JSON documents in the WITH clause:
       , JSON_VALUE (jsonContent, '$.key1') AS header1
       , JSON_VALUE (jsonContent, '$.key2') AS header2
*/
FROM
    OPENROWSET(
        BULK 'https://csiwkpstore.dfs.core.windows.net/csiwkproot/vialtest/0_c63a2568cd1a4d99922c68f3b6283d3f_1.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0b'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [result]


SELECT TOP 100
    /* jsonContent */
    JSON_VALUE (jsonContent, '$.gatewayData') AS gatewayData
/* --> place the keys that you see in JSON documents in the WITH clause:
       , JSON_VALUE (jsonContent, '$.key1') AS header1
       , JSON_VALUE (jsonContent, '$.key2') AS header2
*/
FROM
    OPENROWSET(
        BULK 'https://csiwkpstore.dfs.core.windows.net/csiwkproot/vialtest/0_c63a2568cd1a4d99922c68f3b6283d3f_1.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0b'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [result]


SELECT
    TOP 1000 *
FROM
    OPENROWSET(
        BULK 'https://csiwkpstore.dfs.core.windows.net/csiwkproot/rawdata/**',
        FORMAT = 'PARQUET'
    ) AS [result]


-- This is auto-generated code
SELECT
    distinct(MESScheduleUniqueID) as MESScheduleUniqueID, count(*)
FROM
    OPENROWSET(
        BULK 'https://csiwkpstore.dfs.core.windows.net/csiwkproot/pivotdata/part-00000-6731bc6f-8628-46ab-a670-edc05147e3fb-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]
--WHERE MESScheduleUniqueID is not NULL
GROUP by MESScheduleUniqueID

SELECT
    count(*)
FROM
    OPENROWSET(
        BULK 'https://csiwkpstore.dfs.core.windows.net/csiwkproot/pivotdata/part-00000-6731bc6f-8628-46ab-a670-edc05147e3fb-c000.snappy.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]
