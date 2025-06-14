from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 6, 10),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='spark_submit_bronze_etl',
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
    tags=['spark', 'etl', 'bronze'],
) as dag:

    run_bronze_etl = BashOperator(
        task_id='run_etl_bronze_script',
        bash_command="""
        export SPARK_HOME=/opt/spark
        export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
        export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)

        eval "$(/etc/secret/min_decrypt_secret_eval.sh)"
        #jupyter nbconvert --to script /var/fuse/spark-app/ETL_bronze.ipynb --output-dir=/var/fuse/spark-app/

        $SPARK_HOME/bin/spark-submit \
            --master spark://node1.dw.felicity.net.bd:7077,node2.dw.felicity.net.bd:7077 \
            --conf "spark.driver.extraJavaOptions=-Dspark.authenticate.secret=$SPARK_AUTH_SECRET" \
            /var/fuse/spark-app/ETL_bronze.py
        """,
    )

