```
source /opt/superset/superset-venv/bin/activate
export SUPERSET_CONFIG_PATH=/opt/superset/superset_config.py
export FLASK_APP=superset
eval "$(/etc/lockbox/decrypt_lockbox_eval.sh)"

#/opt/superset/superset-venv/bin/superset
```

### Create Trino Connection
![alt conn1](images/conn1.png)

```
trino://demo:demo@trino.dw.felicity.net.bd:7443/iceberg/default
```

![alt conn2](images/conn3.png)


```
{"connect_args":{"http_scheme":"https","verify":"/usr/local/share/ca-certificates/CA_cert.crt"}}
# OR
{"connect_args":{"http_scheme":"https","verify":"False"}}
```

![alt conn3](images/conn3.png)

