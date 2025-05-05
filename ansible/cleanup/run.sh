ansible-playbook -i  ../inventory.ini zookeeper.yaml 
ansible-playbook -i  ../inventory.ini secret.yaml 
#ansible-playbook -i  ../inventory.ini minio.yaml 
ansible-playbook -i  ../inventory.ini keycloak.yaml 
ansible-playbook -i  ../inventory.ini hadoop.yaml 
ansible-playbook -i  ../inventory.ini cert.yaml 
ansible-playbook -i  ../inventory.ini hive.yaml 

ansible-playbook -i  ../inventory.ini jupyterhub.yaml
ansible-playbook -i  ../inventory.ini trino.yaml 
ansible-playbook -i  ../inventory.ini superset.yaml 

##zoo cleanup
#pip install kazoo;
ansible-playbook -i  ../inventory.ini spark.yaml 
python zookeep_clean.py spark
