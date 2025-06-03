source 00.vip_fqdn.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
minio-ext.yaml;	

eval "$(/etc/secret/decrypt_secret_eval.sh)"
mc alias set s3 https://minio.$FQDN:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"
mc ls s3

echo "exiry policy for airflow-log"
mc ilm export  s3/airflow-log
echo "exiry policy for spark-log"
mc ilm export  s3/spark-logs
echo "exiry policy for dbbackup"
mc ilm export  s3/dbbackup
echo "list users"
mc admin user list s3
echo "group"
mc admin group info s3 rw-group
mc admin group info s3 ro-group
