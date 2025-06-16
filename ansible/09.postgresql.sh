source 00.secrets.sh 
ansible-playbook -i inventory.ini \
-e db_user=${PGUSER}  \
-e db_password=${PGPASSWORD}  \
-e db_user_ro=${PGUSER_RO} \
-e db_password_ro=${PGPASSWORD_RO} \
postgresql.yaml
