ansible-playbook -i  ../inventory.ini zookeeper.yaml 
ansible-playbook -i  ../inventory.ini secret.yaml 
#ansible-playbook -i  ../inventory.ini minio.yaml 
ansible-playbook -i  ../inventory.ini keycloak.yaml 
ansible-playbook -i  ../inventory.ini hadoop.yaml 
ansible-playbook -i  ../inventory.ini spark.yaml 
ansible-playbook -i  ../inventory.ini cert.yaml 
