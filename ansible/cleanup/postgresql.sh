apt remove --purge -y postgresql-14
apt remove --purge -y postgresql-client-14
apt autoremove --purge -y

rm -rf /var/lib/postgresql/
rm -rf /etc/postgresql/
rm -rf /etc/postgresql-common/
rm -rf /var/log/postgresql/
rm -rf /usr/lib/postgresql/

#######
sudo apt update
sudo apt reinstall postgresql-14 -y
sudo apt reinstall postgresql-common -y
sudo apt reinstall postgresql-client-14 -y
systemctl restart postgresql@14-main
