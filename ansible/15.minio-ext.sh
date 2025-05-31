source 00.vip_fqdn.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
minio-ext.yaml;	
