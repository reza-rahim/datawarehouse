source 00.evn.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
-e virtual_ip=$VIRTUAL_IP \
-e keycloak_superset_client_id=$KEYCLOAK_SUPERSET_CLIENT_ID \
superset.yaml
