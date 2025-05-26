```
https://keyclock.dw.felicity.net.bd:6443/realms/devel/.well-known/openid-configuration
```

```
CLIENT_ID=trino
CLIENT_SECRET=55c5b0fa-a8a4-401c-932f-4a6d2eb572ef
USERNAME=demo

ACCESS_TOKEN=$(curl -s -X POST https://keyclock.dw.felicity.net.bd:6443/realms/trino/protocol/openid-connect/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d client_id="$CLIENT_ID" \
  -d client_secret="$CLIENT_SECRET" \
  -d username="$USERNAME" \
  -d password="$PASSWORD" \
  -d grant_type=password \
  -d scope=openid | jq -r '.access_token')


curl -X GET https://keyclock.dw.felicity.net.bd:6443/realms/trino/protocol/openid-connect/userinfo   -H "Authorization: Bearer $ACCESS_TOKEN"

{"sub":"74797c7f-fd74-4e2d-8f4f-29fc96e57299","email_verified":false,"name":"Demo User","preferred_username":"demo","given_name":"Demo","family_name":"User","email":"demo@net.bd"}
```
