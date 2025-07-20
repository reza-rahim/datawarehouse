### How to extract the jar from docker image

```
apt install buildah podman qemu-user-static

mkdir -p /tmp/ranger
chmod 777 /tmp/ranger
podman run -it -v /tmp/ranger:/tmp/ranger --entrypoint /bin/bash apache/ranger:2.6.0 

```

```
## inside docker
## extracpt the tar file
cd
tar cvf /tmp/ranger/ranger.2.6.0.tar /opt/ranger/
cp -r scripts /tmp/ranger/

```

#### Trino audit index

```
curl -X PUT "http://opensearch.dw.felicity.net.bd:9200/ranger_audits_trino" -H 'Content-Type: application/json' -d '{
  "settings": {
    "number_of_shards": 1
  },
  "mappings": {
    "properties": {
      "repo": { "type": "keyword" },
      "eventTime": { "type": "date" },
      "access": { "type": "keyword" },
      "resource": { "type": "text" },
      "result": { "type": "integer" },
      "user": { "type": "keyword" }
    }
  }
}'
```
