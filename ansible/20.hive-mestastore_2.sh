source 00.vip_fqdn.sh
source 00.repo_version.sh
source  00.secrets.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
-e virtual_ip=$VIRTUAL_IP \
-e db_user=${PGUSER}  \
-e db_password=${PGPASSWORD}  \
hive-mestastore_2.yaml;	
