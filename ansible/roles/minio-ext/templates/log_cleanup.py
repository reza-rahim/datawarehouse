from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
import os
import shutil
import logging

LOG_FOLDER = "/opt/airflow/log"
RETENTION_DAYS = 30

def cleanup_logs():
    now = datetime.now()
    cutoff = now - timedelta(days=RETENTION_DAYS)

    for root, dirs, files in os.walk(LOG_PATH):
        for file in files:
            file_path = os.path.join(root, file)
            try:
                if datetime.fromtimestamp(os.path.getmtime(file_path)) < cutoff:
                    os.remove(file_path)
                    logging.info(f"Deleted {file_path}")
            except Exception as e:
                logging.error(f"Error deleting {file_path}: {e}")

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='log_cleanup',
    default_args=default_args,
    description='Cleanup old Airflow logs',
    schedule_interval='0 3 * * *',  # Daily at 3 AM
    start_date=datetime(2024, 1, 1),
    catchup=False,
    is_paused_upon_creation=False,  # 👈 This makes it active by default
    tags=['maintenance'],
) as dag:

    cleanup_task = PythonOperator(
        task_id='delete_old_logs',
        python_callable=cleanup_logs,
    )
