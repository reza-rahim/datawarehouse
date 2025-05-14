
### https://www.cherryservers.com/blog/how-to-set-up-postgresql-database-replication

```
systemctl status postgresql@14-main.service 

#/lib/systemd/system/postgresql@.service

```

```
sudo su - postgres -s /bin/bash

psql
#show database
\l

## connect to keycloak
\c keycloak

SELECT current_database();
#show table
\dt
```


