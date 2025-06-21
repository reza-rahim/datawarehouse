restore_keycloak_db() {
  local dump_file="/var/fuse/dbbackup/node1/keycloak_dump_20250602_2044.sql"

  if [[ ! -f "$dump_file" ]]; then
    echo "Dump file not found: $dump_file"
    return 1
  fi

  echo "Dropping database 'keycloak' if it exists..."
  sudo -u postgres psql -tAc "DROP DATABASE IF EXISTS keycloak;"

  echo "Creating database 'keycloak'..."
  sudo -u postgres psql -tAc "CREATE DATABASE keycloak;"

  echo "Restoring from dump: $dump_file"
  sudo -u postgres psql -d keycloak -f "$dump_file"
}

restore_hive_db() {
  local dump_file="/var/fuse/dbbackup/node1/hive_dump_20250602_2044.sql"

  if [[ ! -f "$dump_file" ]]; then
    echo "Dump file not found: $dump_file"
    return 1
  fi

  echo "Dropping database 'hive' if it exists..."
  sudo -u postgres psql -tAc "DROP DATABASE IF EXISTS hive;"

  echo "Creating database 'hive'..."
  sudo -u postgres psql -tAc "CREATE DATABASE hive;"

  echo "Restoring from dump: $dump_file"
  sudo -u postgres psql -d hive -f "$dump_file"
}

restore_superset_db() {
  local dump_file="/var/fuse/dbbackup/node1/superset_dump_20250602_2044.sql"

  if [[ ! -f "$dump_file" ]]; then
    echo "Dump file not found: $dump_file"
    return 1
  fi

  echo "Dropping database 'superset' if it exists..."
  sudo -u postgres psql -tAc "DROP DATABASE IF EXISTS superset;"

  echo "Creating database 'superset'..."
  sudo -u postgres psql -tAc "CREATE DATABASE superset;"

  echo "Restoring from dump: $dump_file"
  sudo -u postgres psql -d superset -f "$dump_file"
}


#restore_keycloak_db
#restore_hive_db
#restore_superset_db
