
```
systemctl status postgresql@14-main.service 

#/lib/systemd/system/postgresql@.service

```

```
sudo su - postgres -s /bin/bash

psql
## connect to keycloak
\c keycloak

SELECT current_database();
#show table
\dt
```


