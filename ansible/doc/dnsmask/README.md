systemctl stop   systemd-resolved
systemctl disable  systemd-resolved

apt install dnsmasq -y
systemctl restart dnsmasq
systemctl enable dnsmasq

# /etc/dnsmasq.conf


