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

USING ICEBERG
LOCATION 's3a://spark-logs/path/to/existing/table'
```
