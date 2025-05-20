
### zoo.cfg
#### [ZooKeeper 4-letter-word command](https://docs.tibco.com/pub/msgmx/1.1.0/doc/html/GUID-0C192D17-E589-490C-893B-CDCBD2C045D0.html)
```
4lw.commands.whitelist=mntr,stat,conf,cons
#4lw.commands.whitelist=*
```
```
echo stat | openssl s_client -connect 127.0.0.1:2281 -quiet  -cert  /etc/cert.d/server.crt -key /etc/cert.d/server.key
```

```
echo stat | openssl s_client -connect node1.dw.felicity.net.bd:2281 -quiet -CAfile /etc/cert.d/CA_cert.crt
```

```
Received: 160
Sent: 161
Connections: 1
Outstanding: 0
Zxid: 0xf00000001
Mode: follower
Node count: 13

```
```
echo mntr | openssl s_client -connect localhost:2281 -quiet  -cert  /etc/cert.d/server.crt -key /etc/cert.d/server.key
```


```
export CLIENT_JVMFLAGS=" 
  -Dzookeeper.clientCnxnSocket=org.apache.zookeeper.ClientCnxnSocketNetty 
  -Dzookeeper.client.secure=true 
  -Dzookeeper.ssl.keyStore.location=/etc/cert.d//javacert.keystore.jks 
  -Dzookeeper.ssl.keyStore.password=changeit 
  -Dzookeeper.ssl.trustStore.location=/etc/cert.d//javacert.truststore.jks 
  -Dzookeeper.ssl.trustStore.password=changeit"

./zkCli.sh -server node1.dw.felicity.net.bd:2281
```
