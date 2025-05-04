source 00.evn.sh
ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
-e db_password=${DB_PASSWORD} \
-e trino_shared_secret=${TRINO_SHARED_SECRET} \
-e trino_password=${TRINO_PASSWORD} \
-e superset_admin_user=$SUPERSET_ADMIN_USER \
-e superset_admin_password=$SUPERSET_ADMIN_PASSWORD \
secret.yaml
