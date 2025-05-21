### install ansible
```



pip install ansible==11.5.0

eval "$(/etc/secret/decrypt_secret_eval.sh)"; 
```

### define software version


### define virtual ip and fqdn

### create certificate 


### define all the secret

  -Dzookeeper.client.secure=true 
  -Dzookeeper.ssl.keyStore.location={{ cert_dir }}javacert.keystore.jks
  -Dzookeeper.ssl.keyStore.password=changeit
  -Dzookeeper.ssl.trustStore.location={{ cert_dir }}javacert.truststore.jks
  -Dzookeeper.ssl.trustStore.password=changeit

/opt/spark/bin/spark-sql --conf spark.sql.hive.metastore.version=3.1.2 -conf spark.sql.hive.metastore.jars=/opt/apache-hive/lib/hive-3.1.2-jars
/opt/spark/bin/spark-sql \
  --conf spark.sql.hive.metastore.version=3.1.3 \
  --conf spark.sql.hive.metastore.jars=file:///opt/apache-hive/lib 

java -cp  /opt/spark/jars/iceberg-spark-runtime-3.5_2.13-1.8.0.jar  org.apache.iceberg.jdbc.JdbcCatalog --warehouse s3://warehousei/iceberg --uri jdbc:postgresql://postgres.dw.felicity.net.bd:5432/iceberg --user postgres --password postgres migrate



spark-sql 
     --master spark://node1.dw.felicity.net.bd:7077,node2.dw.felicity.net.bd:7077 \
    --conf "spark.driver.extraJavaOptions=-Dspark.authenticate.secret=$SPARK_AUTH_SECRET" \
    --packages org.apache.iceberg:iceberg-spark-runtime-3.5_2.13-1.8 \
    --conf spark.sql.catalog.my_catalog=org.apache.iceberg.spark.SparkCatalog \
    --conf spark.sql.catalog.my_catalog.warehouse=s3a://warehouse/iceberg \
    --conf spark.sql.catalog.my_catalog.type=jdbc \
    --conf spark.sql.catalog.my_catalog.uri=jdbc:postgresql://postgres.dw.felicity.net.bd:5432/iceberg
    --conf spark.sql.catalog.my_catalog.jdbc.user=postgres \
    --conf spark.sql.catalog.my_catalog.jdbc.password=postgres \
    --conf spark.hadoop.fs.s3a.endpoint=https://minio.dw.felicity.net.bd:9000 \
    --conf spark.hadoop.fs.s3a.path.style.access=true \
    --conf spark.hadoop.fs.s3a.connection.ssl.enabled=true
