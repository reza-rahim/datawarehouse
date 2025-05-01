```
pki/
├── ca/
│   ├── rootCA.key
│   └── rootCA.crt
├── server/
│   ├── wildcard.key
│   ├── wildcard.csr
│   ├── wildcard.crt
│   └── server_cert_ext.cnf

```

```
cp pki/server/server.crt ../roles/cert/templates/server.crt
cp pki/server/server.key ../roles/cert/templates/server.key
cp pki/ca/rootCA.crt  ../roles/cert/templates/rootCA.crt
cat pki/server/server.crt > ../roles/cert/templates/server_crt_key.pem
cat pki/server/server.key >> ../roles/cert/templates/server_crt_key.pem

```

##

keytool -importcert -trustcacerts \
    -alias rootCA \
    -file /usr/local/share/ca-certificates/rootCA.crt  \
    -keystore /usr/lib/jvm/jdk-24.0.1-oracle-x64/lib/security/cacerts \
    -storepass changeit
