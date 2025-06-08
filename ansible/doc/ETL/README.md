```
curl  https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/geo_location.csv > /var/fuse/spark-data/landing/geo_location.csv
curl  https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/customer.csv > /var/fuse/spark-data/landing/customer.csv
curl https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/product.csv > /var/fuse/spark-data/landing/product.csv
curl https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/sales_order.csv > /var/fuse/spark-data/landing/sales_order.csv
curl https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/order_item.csv > /var/fuse/spark-data/landing/order_item.csv 
```


```
CREATE DATABASE IF NOT EXISTS bronze;
use bronze;
```


```
CREATE OR REPLACE TEMPORARY VIEW geo_location_csv
(location_id BIGINT, country STRING, state STRING, city STRING, postal_code STRING)
USING csv
OPTIONS (
  path 's3a://spark-data/landing/geo_location.csv',
  header 'true'
);


CREATE OR REPLACE TEMPORARY VIEW customer_csv (
    customer_id INT,
    full_name STRING,
    email STRING,
    phone_number STRING,
    location_id INT,
    created_at TIMESTAMP
)
USING csv
OPTIONS (
  path 's3a://spark-data/landing/customer.csv',
  header 'true'
);

CREATE OR REPLACE TEMPORARY VIEW product_csv (
    product_id INT,
    product_name STRING,
    description STRING,
    category STRING,
    price DECIMAL(10,2),
    in_stock BOOLEAN,
    created_at TIMESTAMP
)
USING csv
OPTIONS (
  path 's3a://spark-data/landing/product.csv',
  header 'true'
);

CREATE OR REPLACE TEMPORARY VIEW sales_order_csv (
    order_id INT,
    customer_id INT,
    order_date TIMESTAMP,
    total_amount DECIMAL(12,2),
    status STRING,
    created_at TIMESTAMP
)
USING csv
OPTIONS (
  path 's3a://spark-data/landing/sales_order.csv',
  header 'true'
);

CREATE OR REPLACE TEMPORARY VIEW order_item_csv (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(12,2)
)
USING csv
OPTIONS (
  path 's3a://spark-data/landing/order_item.csv',
  header 'true'
);
```

```
create database bronze;

CREATE TABLE IF NOT EXISTS bronze.geo_location (
    location_id BIGINT,
    country STRING,
    state STRING,
    city STRING,
    postal_code STRING,
    load_timestamp TIMESTAMP
)
USING iceberg;

CREATE TABLE IF NOT EXISTS bronze.customer (
    customer_id INT,
    full_name STRING,
    email STRING,
    phone_number STRING,
    location_id INT,
    created_at TIMESTAMP,
    load_timestamp TIMESTAMP
)
USING iceberg;

CREATE TABLE IF NOT EXISTS bronze.product (
    product_id INT,
    product_name STRING,
    description STRING,
    category STRING,
    price DECIMAL(10,2),
    in_stock BOOLEAN,
    created_at TIMESTAMP,
    load_timestamp TIMESTAMP
)
USING iceberg;

CREATE TABLE IF NOT EXISTS bronze.sales_order (
    order_id INT,
    customer_id INT,
    order_date TIMESTAMP,
    total_amount DECIMAL(12,2),
    status STRING,
    updated_at TIMESTAMP,
    load_timestamp TIMESTAMP
)
USING iceberg;

CREATE TABLE IF NOT EXISTS bronze.order_item (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(12,2),
    load_timestamp TIMESTAMP
)
USING iceberg;
```

```
DROP DATABASE bronze CASCADE;
```

