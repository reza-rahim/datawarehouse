#group_vars/all/main.yaml
#virtual_ip: 10.10....  #  Replace with your actual virtual ip

#roles/keepalived/vars/main.yaml
#interface: ens160                 # Replace with your actual interface
#auth_pass: secretpass
#virtual_router_id: 51
ansible-playbook -i inventory.ini \ 
-e virtual_ip=$VIRTUAL_IP \
keepalived.yaml
