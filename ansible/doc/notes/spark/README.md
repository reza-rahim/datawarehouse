
```
Find out which version ov hadoop needed to spark 3.5.5
https://github.com/apache/spark/blob/v3.5.5/pom.xml#L125
```
```
export SPARK_HOME=/opt/spark
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)
```

--- 
```
eval "$(/etc/secret/min_decrypt_secret_eval.sh)"; 
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
SPARK_HOME=/opt/spark
${SPARK_HOME}/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://node1.dw.felicity.net.bd:7077,node2.dw.felicity.net.bd:7077 \
  --conf "spark.driver.extraJavaOptions=-Dspark.authenticate.secret=$SPARK_AUTH_SECRET" \
  $SPARK_HOME/examples/jars/spark-examples_2.13-3.5.5.jar
```

