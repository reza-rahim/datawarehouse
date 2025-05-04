```

trino --server=https://trino.dw.felicity.net.bd:7443 --user='' --external-authentication=true

trino --server=https://trino.dw.felicity.net.bd:7443 --user='admin' --password
trino --server=https://trino.dw.felicity.net.bd:7443 --user='demo' --password


select * from iceberg.default.table1;

show catalogs;
use iceberg.default;
select * from table1;

```

```
pip install sqlalchemy sqlalchemy-trino
```
```
from trino.dbapi import connect
from trino.auth import BasicAuthentication

conn = connect(
    host="trino.dw.felicity.net.bd",
    port=7443,
    auth=BasicAuthentication("demo", "demo"),
    catalog="iceberg",  # fixed typo: 'ceberg' → 'iceberg'
    schema="default",
    http_scheme="https",  # fixed typo: 'ttp_scheme' → 'http_scheme'
    verify="/usr/local/share/ca-certificates/rootCA.crt"
)

cur = conn.cursor()
cur.execute("SELECT * from table1")
rows = cur.fetchall()
print(rows)
```


```
rom sqlalchemy import create_engine

engine = create_engine(
    "trino://demo:demo@trino.dw.felicity.net.bd:7443/iceberg/default",
    connect_args={
        "http_scheme": "https",
        "verify": "/usr/local/share/ca-certificates/rootCA.crt",
    }
)

try:
    with engine.connect() as conn:
        result = conn.execute("SELECT * from table1")
        print("Connection successful, result:", result.fetchone())
except Exception as e:
    print("Connection failed:", e)
```

https://github.com/trinodb/trino-python-client/blob/master/README.md

