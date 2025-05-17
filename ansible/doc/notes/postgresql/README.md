
### https://dev.to/johndotowl/postgresql-16-installation-on-ubuntu-2204-51ia

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

### https://severalnines.com/blog/postgresql-bi-directional-logical-replication-deep-dive/

# PostgreSQL Bidirectional Logical Replication Setup with Custom Sequences

## 🖥️ Connect to Databases

```bash
psql -d hive -h 10.16.50.82 -U postgres  # Connect to node2
psql -d hive -h 10.16.50.81 -U postgres  # Connect to node1
```

---

## 🧹 Drop Existing Tables (if any)

```sql
DROP TABLE IF EXISTS mytable;
CREATE TABLE mytable (
    column1 VARCHAR(255)
);
```

---

## 🛠️ Setup Custom Sequences for Bidirectional Replication

### ▶️ On Node 1

```sql
DROP TABLE IF EXISTS mytable_id;
DROP SEQUENCE IF EXISTS mytable_id_seq;
CREATE SEQUENCE mytable_id_seq START 1 INCREMENT 2;

CREATE TABLE mytable_id (
    id INTEGER PRIMARY KEY DEFAULT nextval('mytable_id_seq'),
    column1 VARCHAR(255)
);
```

### ▶️ On Node 2

```sql
DROP TABLE IF EXISTS mytable_id;
DROP SEQUENCE IF EXISTS mytable_id_seq;
CREATE SEQUENCE mytable_id_seq START 2 INCREMENT 2;

CREATE TABLE mytable_id (
    id INTEGER PRIMARY KEY DEFAULT nextval('mytable_id_seq'),
    column1 VARCHAR(255)
);
```

---

## 🔐 UUID-Based Table Example

```sql
DROP TABLE IF EXISTS mytable_u;
CREATE TABLE mytable_u (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  column1 TEXT
);
```

---

## 🔄 Pub/Sub Cleanup Before Setup

### On Node 1

```sql
DROP PUBLICATION IF EXISTS pub_db1;
DROP SUBSCRIPTION IF EXISTS sub_db1;
```

### On Node 2

```sql
DROP PUBLICATION IF EXISTS pub_db2;
DROP SUBSCRIPTION IF EXISTS sub_db2;
```

---

## 🔄 Setup Bidirectional Logical Replication

### On Node 1

```sql
CREATE PUBLICATION pub_db1 FOR ALL TABLES;

CREATE SUBSCRIPTION sub_db1
CONNECTION 'host=10.16.50.82 port=5432 user=postgres password=postgres dbname=hive'
PUBLICATION pub_db2 WITH (copy_data = false, origin = 'none');
```

### On Node 2

```sql
CREATE PUBLICATION pub_db2 FOR ALL TABLES;

CREATE SUBSCRIPTION sub_db2
CONNECTION 'host=10.16.50.81 port=5432 user=postgres password=postgres dbname=hive'
PUBLICATION pub_db1 WITH (copy_data = false, origin = 'none');
```

---

## ✏️ Sample Inserts

### Insert into `mytable` (no primary key)

```sql
INSERT INTO mytable (column1) VALUES ('test data1');
INSERT INTO mytable (column1) VALUES ('test data2');
INSERT INTO mytable (column1) VALUES ('test data3');
```

### Insert into `mytable_id` (integer PK from custom sequence)

```sql
INSERT INTO mytable_id (column1) VALUES ('test data1');
INSERT INTO mytable_id (column1) VALUES ('test data2');
```

### Insert into `mytable_u` (UUID PK)

```sql
INSERT INTO mytable_u (column1) VALUES ('test data2');
```

---

## 🔍 Sample Queries

```sql
SELECT * FROM mytable;
SELECT * FROM mytable_id;
SELECT * FROM mytable_u;
```

---
\

