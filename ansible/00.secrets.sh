
#Postgred
#export DB_USER=postgres
#export DB_PASSWORD=postgres
export ANSIBLE_CONFIG=./ansible.cfg

export PGUSER=postgres
export PGPASSWORD=postgres

#keycloak
export KEYCLOAK_ADMIN=admin
export KEYCLOAK_ADMIN_PASSWORD=admin

# use uuidgen  command
export KEYCLOAK_MINIO_ID=d90e6f09-33a2-4344-af98-c9357495cf78
export KEYCLOAK_MINIO_CLIENT_ID=minio
export KEYCLOAK_MINIO_CLIENT_SECRET=c7372fbd-2e82-41c2-aa4e-e2dd3420c807

export KEYCLOAK_JUPYTER_ID=cd40a46c-ea67-46fd-ab8f-5772633f6d17
export KEYCLOAK_JUPYTER_CLIENT_ID=jupiter
export KEYCLOAK_JUPYTER_CLIENT_SECRET=d3439b37-e911-489c-9d28-5ee3c62141f4

export KEYCLOAK_TRINO_ID=098bbefa-98c3-43fc-a4a7-f3b4322ef725
export KEYCLOAK_TRINO_CLIENT_ID=trino
export KEYCLOAK_TRINO_CLIENT_SECRET=55c5b0fa-a8a4-401c-932f-4a6d2eb572ef

export TRINO_SHARED_SECRET=f9853d25-f71f-4b13-ae0e-ee1864e407a5
export TRINO_USER=demo
export TRINO_PASSWORD=trino

export SUPERSET_ADMIN_USER=demo
export SUPERSET_ADMIN_PASSWORD=demo
export SUPERSET_ADMIN_EMAIL=demo@superset.com
export SUPERSET_SECRET_KEY=8d1d6f67-9231-4594-a67e-5fbcf7f53f26

export KEYCLOAK_SUPERSET_ID=d4e5b20b-ebbc-48ae-9842-e8ee2837d11a
export KEYCLOAK_SUPERSET_CLIENT_ID=superset
export KEYCLOAK_SUPERSET_CLIENT_SECRET=e236ea34-6b6c-4024-9bb2-7c57aa627a0a

export KEYCLOAK_AIRFLOW_ID=d4e5b20b-ebbc-48ae-9842-e8ee2837d11a
export KEYCLOAK_AIRFLOW_CLIENT_ID=airflow
export KEYCLOAK_AIRFLOW_CLIENT_SECRET=e236ea34-6b6c-4024-9bb2-7c57aa627a0a

export KEYCLOAK_DEVEL_REALM=devel
export KEYCLOAK_BI_REALM=bi

export KEYCLOAK_DEVEL_USER=demo
export KEYCLOAK_DEVEL_PASSWORD=demo

export KEYCLOAK_BI_USER=demo
export KEYCLOAK_BI_PASSWORD=demo

#minio
export MINIO_ROOT_USER=minioadmin
export MINIO_ROOT_PASSWORD=minioadmin
export FS_S3A_SECRET_KEY=minioadmin
export FS_S3A_ACCESS_KEY=minioadmin

export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin


#airflow
export AIRFLOW_ADMIN_USERNAME=demo
export AIRFLOW_ADMIN_PASSWORD=demo

#
export JKS_PASSWORD=password

#spark
export SPARK_UI_USER=demo
export SPARK_UI_PASSWORD=demo
export SPARK_AUTH_SECRET=supersecretkey123
