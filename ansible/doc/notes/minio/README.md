
### erasure-coding
#### https://min.io/docs/minio/linux/operations/concepts/erasure-coding.html

### https://min.io/docs/minio/linux/reference/minio-mc.html

```
eval "$(/etc/secret/decrypt_secret_eval.sh)"
mc alias set s3 https://minio.dw.felicity.net.bd:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"

mc ls  s3
## Remove All Objects in the Bucket (Recursive Delete)
mc rm --recursive --force s3/spark

## Remove the Empty Bucket
mc rb  s3/spark 
```

### Group and User creation
#### MinIO Identity and Access Management:
#### https://www.youtube.com/watch?v=Iz8ChZ7FRrw&t=215s
#### https://www.youtube.com/watch?v=Iz8ChZ7FRrw

```
mc admin user list s3

```
