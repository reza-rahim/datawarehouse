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

##### pick a FQDB add it 00.evn.sh 

### check following command
### it should give UUID like 7408768a-a05a-43e1-8a77-73665f97f98f
```
/usr/sbin/blkid | /usr/bin/grep UUID | /usr/bin/grep sda | /usr/bin/head -n 1 | /usr/bin/awk -F' ' '{print $2}' |  /usr/bin/awk -F'=' '{print $2}' | /usr/bin/sed 's/.$//' | /usr/bin/sed 's/^.//'
```


###  
source 00.evn.sh 


##
