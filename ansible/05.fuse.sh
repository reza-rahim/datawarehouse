## Library version
source 00.evn.sh
ansible-playbook -i inventory.ini  \
-e fqdn=$FQDN \
-e virtual_ip=$VIRTUAL_IP \
fuse.yaml

