
```
openssl s_client -connect node1.dw.felicity.net.bd:9083
```
---

```
export SPARK_HOME=/opt/spark
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)

eval "$(/etc/secret/decrypt_secret_eval.sh)";
spark-sql  --master spark://node1.dw.felicity.net.bd:7077,node2.dw.felicity.net.bd:7077 \
           --conf "spark.driver.extraJavaOptions=-Dspark.authenticate.secret=$SPARK_AUTH_SECRET"
```
---
```
CREATE TABLE table1 (
    order_id BIGINT,
    customer_id BIGINT,
    order_amount DECIMAL(10, 2),
    order_ts TIMESTAMP
)
USING iceberg
PARTITIONED BY ( hours(order_ts) );

INSERT INTO table1 VALUES (
    125,
    456,
    36.17,
    TIMESTAMP('2021-01-26 08:10:23')
);

select * from table1
```
```
