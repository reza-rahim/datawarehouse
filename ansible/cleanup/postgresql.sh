apt remove --purge -y postgresql-14
apt remove --purge -y postgresql-client-14
apt autoremove --purge -y

#rm -rf /var/lib/postgresql/
#rm -rf /etc/postgresql/
#rm -rf /etc/postgresql-common/
#rm -rf /var/log/postgresql/
#rm -rf /usr/lib/postgresql/

#######
sudo apt update
sudo apt reinstall postgresql-14 -y
sudo apt reinstall postgresql-common -y
sudo apt reinstall postgresql-client-14 -y
systemctl restart postgresql@14-main



apt remove --purge -y postgresql-16
apt remove --purge -y postgresql-client-16
apt autoremove --purge -y
systemctl daemon-reload
systemctl reset-failed
rm -rf /etc/postgresql/



sudo systemctl stop postgresql
sudo systemctl stop postgresql@16-main
sudo apt-get --purge remove postgresql-16 postgresql-client-16 postgresql-contrib-16 -y
sudo apt-get --purge remove postgresql postgresql-* libpq-dev postgresql-common -y
sudo apt-get --purge remove postgresql postgresql-* libpq-dev postgresql-common -y
sudo rm -rf /var/lib/postgresql/16
sudo rm -rf /etc/postgresql/16
sudo rm -rf /etc/postgresql-common
sudo rm -rf /var/log/postgresql
sudo rm -rf /var/run/postgresql
sudo apt-get autoremove --purge -y
sudo apt-get autoclean
 

