
### opensearch

#### https://docs.opensearch.org/docs/latest/about/

#### https://github.com/opensearch-project/ansible-playbook/tree/main


```
curl -X GET http://10.16.50.81:9200/_nodes/_all/name,ip?pretty

curl -u "admin:admin"  -X GET https://node1.dw.felicity.net.bd:9200/_nodes/_all/name,ip?pretty 
```

#### Set admin_dn 

```
openssl x509 -in /etc/cert.d/server.crt -noout -subject

## in /etc/opensearch/opensearch.yaml 
plugins.security.authcz.admin_dn:
  - "CN=example.com,OU=Unit,O=Organization,L=City,ST=State,C=US"
```
