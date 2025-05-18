
### zoo.cfg
```
4lw.commands.whitelist=stat, ruok, conf, isro
4lw.commands.whitelist=*
```
```
echo stat | openssl s_client -connect localhost:2281 -quiet  -cert  /etc/cert.d/server.crt -key /etc/cert.d/server.key
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
