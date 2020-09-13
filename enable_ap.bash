cp interfaces.ap /etc/network/interfaces
cp dnsmasq.conf.ap /etc/dnsmasq.conf
cp dhcpcd.conf.ap /etc/dhcpcd.conf
service hostapd start
service dnsmasq start
