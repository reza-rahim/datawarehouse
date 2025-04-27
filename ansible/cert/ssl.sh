#!/bin/bash

set -e

# === Configuration ===
ORG="Felicity Ltd"
OU="IT Department"
CITY="Dhaka"
STATE="Dhaka"
COUNTRY="BD"
ROOT_CA_CN="Felicity Root CA"
WILDCARD_CN="*.dw.felicity.net.bd"
DAYS_VALID_CA=3650
DAYS_VALID_SERVER=825

# === Directory setup ===
mkdir -p pki/{ca,server}
cd pki

echo "Creating Root CA..."

# === Root CA Private Key ===
openssl genrsa -out ca/rootCA.key 4096

# === Root CA Certificate ===
openssl req -x509 -new -nodes -key ca/rootCA.key -sha256 -days $DAYS_VALID_CA -out ca/rootCA.crt \
-subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORG/OU=$OU/CN=$ROOT_CA_CN"

echo "Root CA created."

echo "Creating Server certificate request (server)..."

# === Server Private Key ===
openssl genrsa -out server/server.key 2048

# === Server CSR ===
openssl req -new -key server/server.key -out server/server.csr \
-subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORG/OU=$OU/CN=$WILDCARD_CN"

echo "Creating server extension config for server..."

# === Server Extensions for SAN, etc ===
cat > server/server_cert_ext.cnf <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.dw.felicity.net.bd
DNS.2 = dw.felicity.net.bd
EOF

echo "Signing server server certificate with Root CA..."

# === Sign the Server CSR with Root CA ===
openssl x509 -req -in server/server.csr -CA ca/rootCA.crt -CAkey ca/rootCA.key -CAcreateserial \
-out server/server.crt -days $DAYS_VALID_SERVER -sha256 -extfile server/server_cert_ext.cnf

echo "Wildcard certificate signed."

# === Done! Show locations ===
echo "=== Certificates Created Successfully ==="
echo "Root CA Certificate: $(pwd)/ca/rootCA.crt"
echo "Root CA Private Key: $(pwd)/ca/rootCA.key"
echo "Wildcard Server Private Key:  $(pwd)/server/server.key"
echo "Wildcard Server Certificate:  $(pwd)/server/server.crt"

