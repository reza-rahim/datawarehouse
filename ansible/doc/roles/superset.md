# 📘 Superset Deployment Playbook Summary

This Ansible playbook automates the end-to-end setup of **Apache Superset**, including installation, configuration, and database connection (e.g., Trino).

---

## ✅ Main Steps

### 1. Install System Dependencies
Installs required system packages:
- `python3-virtualenv`
- Development headers for LDAP, SSL, SASL, and PostgreSQL

### 2. Create Directory Structure
- Creates the main Superset home directory (`{{ superset_home }}`)
- Creates a `pythonpath` subdirectory for custom Superset configuration

### 3. Deploy Configuration Files
Copies templated configuration files to the Superset directory:
- `requirements.txt` (Python packages)
- `superset_config.py` (custom config)
- `superset.txt` (Superset dependencies)
- `create_database.py` (Trino DB script)
- `superset.service` (Systemd service unit)

### 4. Set Up Python Environment
- Creates a virtual environment at `{{ superset_home }}/venv`
- Installs dependencies from `requirements.txt` and `superset.txt`

### 5. Initialize Superset
On the primary Superset node only:
- Runs `superset db upgrade`
- Creates an admin user
- Executes `superset init` to initialize roles and default objects

### 6. Enable and Reload Superset Service
- Reloads `systemd` daemon to register Superset service
- Flushes handlers to restart Superset if configuration changed

### 7. Add Trino Database Connection
- Executes `create_database.py` to register Trino in Superset
- Sets SSL bundle and uses admin credentials for authentication

---

## 🧠 Conditional Logic

Some steps (e.g., database setup, admin user creation) only run on the **first host** in the Superset inventory group:

```yaml
when: groups['superset'].index(inventory_hostname) == 0

