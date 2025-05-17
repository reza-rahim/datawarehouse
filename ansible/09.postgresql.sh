source 00.secrets.sh 
ansible-playbook -i inventory.ini \
-e db_user=${PGUSER}  \
-e db_password=${PGPASSWORD}  \
postgresql.yaml
