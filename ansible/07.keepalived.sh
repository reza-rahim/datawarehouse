source 00.vip_fqdn.sh 
ansible-playbook -i inventory.ini \
-e virtual_ip=$VIRTUAL_IP \
keepalived.yaml
