source 00.vip_fqdn.sh
source 00.repo_version.sh
source 00.secrets.sh 
ansible-playbook -i inventory.ini  \
-e fqdn=$FQDN \
-e virtual_ip=$VIRTUAL_IP \
fuse.yaml
sleep 5
/usr/bin/df /var/fuse/* |/usr/bin/grep s3fs
