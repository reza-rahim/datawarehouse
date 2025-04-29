
export HADOOP_HOME=/opt/hadoop-3.2.0
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export HADOOP_CLASSPATH=$($HADOOP_HOME/bin/hadoop classpath)
export HIVE_HOME=/opt/apache-hive
export HIVE_CONF_DIR=$HIVE_HOME/conf



sudo -u postgres psql

# Inside psql shell:
DROP DATABASE hive;
CREATE DATABASE hive;

##
Open a VPN tunnel

```
pip install sshuttle
sshuttle --ssh-cmd "ssh -p 2322" -r one@103.168.140.118 10.16.50.0/24
```

### adjust entry for /etc/hosts files

```
group_vars/all/host.yaml
```

### Check the software version on 
group_vars/all/repo.yaml 

### set the postgres version group_vars/all/postgresql.yaml 
```
 sudo systemctl status postgresql@14-main 
```

### Minio define how many disk to be mounted group_vars/all/minio.yaml
```
disk_range
mount_points
```

### Create CA following cert/README.md file.

cp cert/pki/server/server.crt roles/cert/templates/server.crt 
cp cert/pki/server/server.key roles/cert/templates/server.key


##### pick a FQDB add it 00.evn.sh 

### check following command
### it should give UUID like 7408768a-a05a-43e1-8a77-73665f97f98f
```
/usr/sbin/blkid | /usr/bin/grep UUID | /usr/bin/grep sda | /usr/bin/head -n 1 | /usr/bin/awk -F' ' '{print $2}' |  /usr/bin/awk -F'=' '{print $2}' | /usr/bin/sed 's/.$//' | /usr/bin/sed 's/^.//'
```


###  
source 00.evn.sh 


##


## Minio
## Keycloak
https://www.youtube.com/watch?v=mv8I1wvTCrE
https://min.io/docs/minio/macos/operations/external-iam/configure-keycloak-identity-management.html


## Spark: adjust number of spark worker per node

number_of_spark_worker_per_node



Jupyter :

sudo usermod -a -G application demo 
