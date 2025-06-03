sudo -u postgres psql  -tAc "DROP DATABASE IF EXISTS keycloak;"
sudo -u postgres psql  -tAc "CREATE DATABASE keycloak;"
sudo -u postgres psql -d keycloak -f /var/fuse/dbbackup/node1/keycloak_dump_20250602_2044.sq
