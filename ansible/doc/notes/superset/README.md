```
source /opt/superset/superset-venv/bin/activate
export SUPERSET_CONFIG_PATH=/opt/superset/superset_config.py
export FLASK_APP=superset
eval "$(/etc/lockbox/decrypt_lockbox_eval.sh)"

#/opt/superset/superset-venv/bin/superset
```
