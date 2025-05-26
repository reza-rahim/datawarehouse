```
https://keyclock.dw.felicity.net.bd:6443/realms/devel/.well-known/openid-configuration
```

```
CLIENT_ID=trino
CLIENT_SECRET=55c5b0fa-a8a4-401c-932f-4a6d2eb572ef
USERNAME=demo
---
ACCESS_TOKEN=$(curl -s -X POST https://keyclock.dw.felicity.net.bd:6443/realms/trino/protocol/openid-connect/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d client_id="$CLIENT_ID" \
  -d client_secret="$CLIENT_SECRET" \
  -d username="$USERNAME" \
  -d password="$PASSWORD" \
  -d grant_type=password \
  -d scope=openid | jq -r '.access_token')

```
```
{
  "access_token": "eyJ..",
   "expires_in": 300,
   "refresh_expires_in": 1800,
   "refresh_token": "eyJ ..",
   "token_type": "Bearer",
   "id_token": "eyJh.."
   "not-before-policy": 0,
   "session_state": "4c89227c-8eed-4527-93a1-28f33a466402",
  "scope": "openid profile email"
}
```
---
```
curl -X GET https://keyclock.dw.felicity.net.bd:6443/realms/trino/protocol/openid-connect/userinfo   -H "Authorization: Bearer $ACCESS_TOKEN"

{"sub":"74797c7f-fd74-4e2d-8f4f-29fc96e57299","email_verified":false,"name":"Demo User","preferred_username":"demo","given_name":"Demo","family_name":"User","email":"demo@net.bd"}
```
