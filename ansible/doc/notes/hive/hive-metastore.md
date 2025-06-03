```
SELECT * FROM "TBLS";
SEELCT * FROM "DBS";
SELECT * FROM "COLUMNS_V2";
SELECT * FROM "CDS";
SELECT * FROM "PARTITIONS";
SELECT * FROM "PARTITION_KEYS";
SELECT * FROM "TABLE_PARAMS";
```

```
select * 
```

```
SELECT d."NAME" AS db_name, t."TBL_NAME" AS table_name
FROM "TBLS" t
JOIN "DBS" d ON t."DB_ID" = d."DB_ID";
```

```
SELECT 
  d."NAME" AS database_name,
  t."TBL_NAME" AS table_name,
  t."TBL_TYPE" AS table_type,
  s."LOCATION" AS hdfs_path
FROM "TBLS" t
LEFT JOIN "DBS" d ON t."DB_ID" = d."DB_ID"
LEFT JOIN "SDS" s ON t."SD_ID" = s."SD_ID"
LIMIT 100;
```
