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


### Complex example 
```
CREATE TABLE default.sales_data (
    id BIGINT,
    customer_id STRING,
    product_id STRING,
    region STRING,
    category STRING,
    price DOUBLE,
    sale_date DATE,
    created_at TIMESTAMP
)
USING iceberg
PARTITIONED BY (
    bucket(16, customer_id),  -- Bucketing
    days(sale_date),          -- Date partitioning
    truncate(5, category)     -- Truncated text partition
)
TBLPROPERTIES (
    'format-version' = '2',
    'write.format.default' = 'parquet',
    'write.metadata.delete-after-commit.enabled' = 'true',
    'write.metadata.previous-versions-max' = '5'
);

```

```
INSERT INTO default.sales_data VALUES
  (1,  'cust001', 'prodA', 'North',   'Electronics', 299.99, DATE '2025-06-01', TIMESTAMP '2025-06-01 10:00:00'),
  (2,  'cust002', 'prodB', 'South',   'Grocery',     19.95,  DATE '2025-06-02', TIMESTAMP '2025-06-02 11:15:30'),
  (3,  'cust003', 'prodC', 'East',    'Clothing',    79.50,  DATE '2025-06-03', TIMESTAMP '2025-06-03 14:45:00'),
  (4,  'cust004', 'prodD', 'West',    'Books',       12.99,  DATE '2025-06-01', TIMESTAMP '2025-06-01 09:00:00'),
  (5,  'cust005', 'prodE', 'Central', 'Electronics', 499.95, DATE '2025-06-03', TIMESTAMP '2025-06-03 16:30:45'),
  (6,  'cust006', 'prodF', 'North',   'Electronics', 150.00, DATE '2025-06-01', TIMESTAMP '2025-06-01 08:12:11'),
  (7,  'cust007', 'prodG', 'South',   'Clothing',    220.40, DATE '2025-06-02', TIMESTAMP '2025-06-02 12:45:10'),
  (8,  'cust008', 'prodH', 'East',    'Grocery',     34.20,  DATE '2025-06-03', TIMESTAMP '2025-06-03 10:22:22'),
  (9,  'cust009', 'prodI', 'West',    'Books',       45.50,  DATE '2025-06-03', TIMESTAMP '2025-06-03 18:00:00'),
  (10, 'cust010', 'prodJ', 'Central', 'Electronics', 120.75, DATE '2025-06-01', TIMESTAMP '2025-06-01 07:45:15'),
  (11, 'cust011', 'prodK', 'North',   'Grocery',     29.99,  DATE '2025-06-02', TIMESTAMP '2025-06-02 15:33:29'),
  (12, 'cust012', 'prodL', 'South',   'Books',       60.00,  DATE '2025-06-03', TIMESTAMP '2025-06-03 09:10:10'),
  (13, 'cust013', 'prodM', 'East',    'Clothing',    89.95,  DATE '2025-06-02', TIMESTAMP '2025-06-02 16:40:00'),
  (14, 'cust014', 'prodN', 'West',    'Electronics', 209.95, DATE '2025-06-01', TIMESTAMP '2025-06-01 13:20:55'),
  (15, 'cust015', 'prodO', 'Central', 'Clothing',    75.00,  DATE '2025-06-03', TIMESTAMP '2025-06-03 19:45:30'),
  (16, 'cust016', 'prodP', 'North',   'Books',       18.75,  DATE '2025-06-01', TIMESTAMP '2025-06-01 20:00:00'),
  (17, 'cust017', 'prodQ', 'South',   'Electronics', 349.90, DATE '2025-06-02', TIMESTAMP '2025-06-02 21:25:00'),
  (18, 'cust018', 'prodR', 'East',    'Grocery',     24.99,  DATE '2025-06-03', TIMESTAMP '2025-06-03 22:10:10'),
  (19, 'cust019', 'prodS', 'West',    'Books',       10.00,  DATE '2025-06-01', TIMESTAMP '2025-06-01 06:15:00'),
  (20, 'cust020', 'prodT', 'Central', 'Clothing',    54.60,  DATE '2025-06-02', TIMESTAMP '2025-06-02 23:59:59');
```



