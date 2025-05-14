
### https://dev.to/johndotowl/postgresql-16-installation-on-ubuntu-2204-51ia
### https://severalnines.com/blog/postgresql-bi-directional-logical-replication-deep-dive/

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


