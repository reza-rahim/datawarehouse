
### Change openssl.cnf 
### DNS.1=*.dw.felicity.net.bd

### Step 1: Becoming your own CA
```
# Generate an RSA private key of size 2048
openssl genrsa -out CA_cert.key 2048

# Generate a root certificate valid for ten years
openssl req -x509 -new -nodes -key CA_cert.key -sha256 -days 3650 -out CA_cert.crt

# To check just created root certificate:
openssl x509 -in CA_cert.crt  -text -noout
```

```
# First, create a private key to be used during the certificate signing process:
openssl genrsa -out server.key 2048

# Use the private key to create a certificate signing request:
openssl req -new -key server.key -out server.csr

## create the openssl.cnf 

```

```
openssl x509 -req \
    -in server.csr \
    -CA CA_cert.crt \
    -CAkey CA_cert.key \
    -CAcreateserial \
    -out server.crt \
    -days 730 \
    -sha256 \
    -extfile openssl.cnf

## To verify that the certificate is built correctly:
openssl verify -CAfile CA_cert.crt -verify_hostname api.$FQDN server.crt
openssl verify -CAfile CA_cert.crt -verify_ip  127.0.0.1  server.crt


```

```
cat server.crt >> server_crt_key.pem
cat server.key >> server_crt_key.pem

```

### copy cert file under ansible
```
cp CA_cert.crt ../roles/cert/templates/
cp server.crt ../roles/cert/templates/
cp server.key ../roles/cert/templates/
cp server_crt_key.pem ../roles/cert/templates/
```



###
https://support.securly.com/hc/en-us/articles/206058318-How-to-install-the-Securly-SSL-certificate-on-Mac-OSX

To manually install the Securly SSL certificate:

- Download the Securly certificate CRT file. securly_ca_2034.crt
- Search for Keychain Access in Spotlight search, then press Return. 
- Select "System" in the left-hand column.
- Open File > Import Items or drag and drop to import the certificate files into the "System" keychain.
- If you’re asked to provide a name and password, type the name and password for an administrator user of the computer.
- The certificate should now show with a red X. That means it is entrusted. To provide trust, double-click the *.securly.com certificate. Under "Trust", change the setting at the top (When using this certificate) to "Always Trust". The GIF is pictured below.

