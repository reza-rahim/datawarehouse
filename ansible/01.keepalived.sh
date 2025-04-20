#roles/keepalived/vars/main.yaml
#interface: ens160                 # Replace with your actual interface
#auth_pass: secretpass
#virtual_router_id: 51
ansible-playbook -i inventory.ini  keepalived.yaml
