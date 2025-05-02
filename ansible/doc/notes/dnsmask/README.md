```
systemctl stop   systemd-resolved
systemctl disable  systemd-resolved

apt install dnsmasq -y
systemctl restart dnsmasq
systemctl enable dnsmasq
```

# /etc/dnsmasq.conf

```
systemctl stop   dnsmasq
systemctl disable  dnsmasq

systemctl enable systemd-resolved
systemctl restart systemd-resolved

