
```
export SPARK_HOME=/opt/spark
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)
```

--- 
```
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export SPARK_HOME=/opt/spark; ${SPARK_HOME}/bin/spark-submit  --class org.apache.spark.examples.SparkPi --master spark://node1.dw.felicity.net.bd:7077,node2.dw.felicity.net.bd:7077  $SPARK_HOME/examples/jars/spark-examples_2.13-3.4.4.jar
```

