cp interfaces.ap /etc/network/interfaces
# cp dnsmasq.conf.ap /etc/dnsmasq.conf
# cp dhcpcd.conf.ap /etc/dhcpcd.conf
systemctl disable dhcpcd.service
systemctl disable dhcpcd5.service
systemctl enable hostapd.service
# service dnsmasq start
