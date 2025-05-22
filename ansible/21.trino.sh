source 00.repo_version.sh
source 00.vip_fqdn.sh 
source 00.secrets.sh 
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
-e virtual_ip=$VIRTUAL_IP \
-e keycloak_trino_client_id=$KEYCLOAK_TRINO_CLIENT_ID \
-e keycloak_bi_realm=$KEYCLOAK_BI_REALM \
trino.yaml
