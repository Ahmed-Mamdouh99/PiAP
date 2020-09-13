cp interfaces.wifi /etc/network/interfaces
cp dnsmasq.conf.wifi /etc/dnsmasq.conf
cp dhcpcd.conf.wifi /etc/dhcpcd.conf
service hostapd stop
service dnsmasq stop
