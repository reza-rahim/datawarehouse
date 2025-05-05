
/opt/keycloak/bin/kcadm.sh create clients -r bi -f - << EOF
{
  "clientId": "superset",
  "enabled": true,
  "clientAuthenticatorType": "client-secret",
  "secret": "${KEYCLOAK_SUPERSET_CLIENT_SECRET}",
  "redirectUris": ["https://superset.dw.felicity.net.bd:8088/*"],
  "protocol": "openid-connect",
  "publicClient": false,
  "standardFlowEnabled": true,
  "directAccessGrantsEnabled": true
}
EOF

