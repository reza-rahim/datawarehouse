# Creating a Custom SSL Certificate with OpenSSL

This guide describes how to create a self-signed SSL certificate using OpenSSL, generate your own Certificate Authority (CA), and sign a server certificate with Subject Alternative Names (SANs). This setup is ideal for local development and internal environments.

---

## Step 1: Become Your Own Certificate Authority (CA)

### Generate a Root CA Key and Certificate

```bash
# Generate a 2048-bit RSA private key
openssl genrsa -out CA_cert.key 2048

# Generate a root certificate valid for 10 years
openssl req -x509 -new -nodes -key CA_cert.key -sha256 -days 9125 -out CA_cert.crt \
 -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=example.com"

# Optional: Inspect the certificate details
openssl x509 -in CA_cert.crt -text -noout
```

---

## Step 2: Generate `openssl.cnf` with Subject Alternative Names

Create a script to generate an OpenSSL config file that includes SANs. The domain is dynamically loaded from an environment variable.

**Tip:** To override the default domain, export the `DOMAIN_ENV` variable:
```
DOMAIN="dw.opensource.bd"
```

```
#!/bin/bash
# Generate OpenSSL extension config
cat <<EOF > openssl.cnf
basicConstraints       = CA:FALSE
authorityKeyIdentifier = keyid:always, issuer:always
keyUsage               = nonRepudiation, digitalSignature, keyEncipherment, dataEncipherment
subjectAltName         = @alt_names

[ alt_names ]
DNS.1 = *.$DOMAIN
IP.1  = 127.0.0.1
EOF

cat openssl.cnf
```



---



## Step 3: Generate and Sign a Server Certificate


### Generate a Private Key and Certificate Signing Request (CSR)

```bash
# Generate a private key for the server
openssl genrsa -out server.key 2048

# Create a certificate signing request (CSR)
openssl req -new -key server.key -out server.csr
```

### Sign the CSR with Your Custom Root CA

```bash
openssl x509 -req \
  -in server.csr \
  -CA CA_cert.crt \
  -CAkey CA_cert.key \
  -CAcreateserial \
  -out server.crt \
  -days 730 \
  -sha256 \
  -extfile openssl.cnf
```
---

## Step 4: Print and Verify the Certificate

### print the cert
```
openssl x509 -in server.crt  -text -noout
```

```bash
# Verify using domain name
openssl verify -CAfile CA_cert.crt -verify_hostname api.$DOMAIN server.crt

# Verify using IP address
openssl verify -CAfile CA_cert.crt -verify_ip 127.0.0.1 server.crt
```

---

## Step 5: Combine Certificate and Key (Optional)

This creates a single PEM file that includes both the certificate and private key.

```bash
cat server.crt > server_crt_key.pem
cat server.key >> server_crt_key.pem
```

---

## Step 6: Deploy Certificates with Ansible

Copy the generated certificates and key to your Ansible role's templates directory:

```bash
cp CA_cert.crt ../../roles/cert/templates/
cp server.crt ../../roles/cert/templates/
cp server.key ../../roles/cert/templates/
cp server_crt_key.pem ../../roles/cert/templates/
```







