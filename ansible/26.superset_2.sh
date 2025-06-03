source 00.repo_version.sh
source 00.vip_fqdn.sh
source 00.secrets.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
-e virtual_ip=$VIRTUAL_IP \
-e keycloak_superset_client_id=$KEYCLOAK_SUPERSET_CLIENT_ID \
superset_2.yaml
