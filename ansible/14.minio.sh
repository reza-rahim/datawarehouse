source 00.vip_fqdn.sh
source 00.repo_version.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
minio.yaml;	
