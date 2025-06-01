source 00.vip_fqdn.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
minio-ext.yaml;	

eval "$(/etc/secret/decrypt_secret_eval.sh)"
mc alias set s3 https://minio.$FQDN:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"
mc ls s3
