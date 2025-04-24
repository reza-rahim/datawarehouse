source ../00.evn.sh 
/opt/keycloak/bin/kcadm.sh config credentials  --server https://keyclock.$FQDN:6443/ --realm master --user $KEYCLOAK_ADMIN --password $KEYCLOAK_ADMIN_PSASSWORD 


cat <<EOF > mapper.json
{
  "name": "preferred_username",
  "protocol": "openid-connect",
  "protocolMapper": "oidc-usermodel-property-mapper",
  "config": {
    "user.attribute": "username",
    "claim.name": "preferred_username",
    "jsonType.label": "String",
    "id.token.claim": "true",
    "access.token.claim": "true",
    "userinfo.token.claim": "true"
  }
}
EOF

/opt/keycloak/bin/kcadm.sh create "clients/$KEYCLOAK_MINIO_ID/protocol-mappers/models" \
  -r devel -f mapper.json


## list the mapper
/opt/keycloak/bin/kcadm.sh get clients/d90e6f09-33a2-4344-af98-c9357495cf78/protocol-mappers/models -r devel | jq '.[] | {name, id}'

##
cat <<EOF > policy-mapper.json
{
  "name": "minio-policy-mapper",
  "protocol": "openid-connect",
  "protocolMapper": "oidc-hardcoded-claim-mapper",
  "config": {
    "claim.name": "policy",
    "claim.value": "readwrite",
    "claim.include.in.id.token": "true",
    "claim.include.in.access.token": "true",
    "claim.include.in.userinfo": "true"
  }
}
EOF

/opt/keycloak/bin/kcadm.sh create "clients/$KEYCLOAK_MINIO_ID/protocol-mappers/models" -r devel -f policy-mapper.json
##



curl -X POST "https://keyclock.dw.felicity.net.bd:6443/realms/devel/protocol/openid-connect/token" \
-d "client_id=minio" \
-d "client_secret=$KEYCLOAK_MINIO_CLIENT_SECRET" \
-d "code=<your-authorization-code>" \
-d "redirect_uri=https://minio.dw.felicity.net.bd:9001/oauth_callback" \
-d "grant_type=authorization_code"

