eval "$({{ secret_dir }}/decrypt_secret_eval.sh)"
    mc alias set s3 https://minio.{{ fqdn }}:9000 {{ lookup('env', 'MINIO_ROOT_USER') }} {{ lookup('env', 'MINIO_ROOT_PASSWORD') }}
    mc mb s3/{{ spark_s3_bucket }}
    mc mb s3/{{ metastore_warehouse_dir }}
    mc mb s3/{{ airflow_s3_bucket_dag }}
    mc mb s3/{{ airflow_s3_bucket_log }}
    mc mb s3/{{ jupyterhub_s3_bucket }}
    touch /tmp/init
    mc cp /tmp/init s3/{{ spark_s3_bucket }}/logs/init
    mc cp /tmp/simple_iceberg_demo.ipynb s3/{{ jupyterhub_s3_bucket }}/simple_iceberg_demo.ipynb
    mc cp /tmp/hello_world_dag.py s3/{{ airflow_s3_bucket_dag }}/hello_world_dag.py
    mc cp /tmp/log_cleanup.py s3/{{ airflow_s3_bucket_dag }}/log_cleanup.py
