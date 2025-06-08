```
curl  https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/geo_location.csv > /var/fuse/spark-data/landing/geo_location.csv
curl  https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/customer.csv > /var/fuse/spark-data/landing/customer.csv
curl https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/product.csv > /var/fuse/spark-data/landing/product.csv
curl https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/sales_order.csv > /var/fuse/spark-data/landing/sales_order.csv
curl https://raw.githubusercontent.com/reza-rahim/ai_data/refs/heads/main/dw/order_item.csv > /var/fuse/spark-data/landing/order_item.csv 
```


```
CREATE DATABASE IF NOT EXISTS dw;
use dw;
```


```
CREATE OR REPLACE TEMPORARY VIEW geo_location_csv
(location_id BIGINT, country STRING, state STRING, city STRING, postal_code STRING)
USING csv
OPTIONS (
  path 's3a://spark-data/landing/geo_location.csv',
  header 'true'
);

```
```
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
```

