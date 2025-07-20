### How to extract the jar from docker image

```
apt install buildah podman qemu-user-static

mkdir -p /tmp/ranger
chmod 777 /tmp/ranger
podman run -it -v /tmp/ranger:/tmp/ranger --entrypoint /bin/bash apache/ranger:2.6.0 

```

```
## inside docker
## extracpt the tar file
cd
tar cvf /tmp/ranger/ranger.2.6.0.tar /opt/ranger/
cp -r scripts /tmp/ranger/

```


