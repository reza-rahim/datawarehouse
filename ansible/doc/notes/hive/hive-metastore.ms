```
SELECT d."NAME" AS db_name, t."TBL_NAME" AS table_name
FROM "TBLS" t
JOIN "DBS" d ON t."DB_ID" = d."DB_ID";
```
