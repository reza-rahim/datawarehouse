
### erasure-coding
#### https://min.io/docs/minio/linux/operations/concepts/erasure-coding.html

### https://min.io/docs/minio/linux/reference/minio-mc.html

```
eval "$({{ secret_dir }}/decrypt_secret_eval.sh)"
mc alias set s3 https://minio.dw.felicity.net.bd:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"

mc ls  s3
mc rm  s3/jupyterhub
```
