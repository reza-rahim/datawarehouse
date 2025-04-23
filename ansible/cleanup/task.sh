apt remove postgresql-14
sudo rm -rf /var/lib/postgresql/14/
sudo rm -rf /etc/postgresql/14/

## minio 

systemctl stop minio
rm /etc/systemd/system/minio.service
sudo umount /mnt/disk1
sudo umount /mnt/disk2
sudo wipefs -a /dev/sdb
sudo wipefs -a /dev/sdc
sudo dd if=/dev/zero of=/dev/sdb bs=1M count=100
sudo dd if=/dev/zero of=/dev/sdc bs=1M count=100


systemctl daemon-reload
