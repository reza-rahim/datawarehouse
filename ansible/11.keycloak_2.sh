source 00.vip_fqdn.sh
source 00.repo_version.sh
source  00.secrets.sh 
ansible-playbook -i inventory.ini \
-e db_user=${PGUSER}  \
-e db_password=${PGPASSWORD}  \
keycloak_2.yaml;	
