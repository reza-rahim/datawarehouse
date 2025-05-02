# 🚀 Trino Installation & Configuration (Ansible Playbook Summary)

This Ansible playbook automates the installation and configuration of **Trino**, a distributed SQL query engine, on a target host. It includes directory setup, configuration deployment, and CLI installation.

---

## ✅ Main Tasks

### 1. Check Installation
- Verifies if Trino is already installed by checking the presence of the `{{ trino_home }}` directory.

### 2. Download and Extract Trino
- Downloads and extracts the Trino tarball from a central repository server.
- Only runs if Trino isn't already installed.

### 3. Create Symbolic Link
- Creates a symlink from the extracted Trino directory to `{{ trino_home }}` for easier upgrades and standardization.

### 4. Create Required Directories
- Creates configuration and data directories:
  - `{{ trino_home }}/etc`
  - `{{ trino_home }}/etc/catalog`
  - `{{ trino_data_dir }}`

### 5. Deploy Configuration Files
- Uses templated files to configure:
  - Trino service (`trino.service`)
  - JVM and node properties
  - Trino configuration files (e.g., `config.properties`, `jvm.config`)
  - Catalog definitions (`iceberg.properties`)
  - Password authentication settings

### 6. Install Trino CLI
- Downloads the Trino CLI and places it in `/usr/bin/trino` with execute permissions.

### 7. Reload Systemd
- Reloads the systemd daemon to register the new Trino service file.

---

## 🔁 Handlers

- If any configuration file changes, the playbook triggers a handler:  
  **`restart start_trino`**

---

## 💡 Notes

- Uses a **central repository host** (`groups['repo'][0]`) for downloading binaries and CLI tools.
- All configuration files are deployed using the **Ansible `template` module** to allow customization via Jinja2 variables.

---


