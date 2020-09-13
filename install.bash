# Install required packages
apt-get install dnsmasq hostapd dhcpcd5
systemctl stop dnsmasq
systemctl stop hostapd

# Save old dhcpcd conf file
cp /etc/dhcpcd.conf dhcpcd.conf.wifi
cp dhcpcd.conf.wifi dhcpcd.conf.ap

# Configure static ip
printf "interface wlan0\n  static ip_address=192.168.2.1/24" >> dhcpcd.conf.ap

service dhcpcd restart

# Configuring dhcp server (dnsmasq)
cp /etc/dnsmasq.conf dnsmasq.conf.wifi
cp dnsmasq.conf.wifi dnsmasq.conf.ap
printf "interface=wlan0\n  dhcp-range=192.168.2.2,192.168.2.20,255.255.255.0,24h" >> dnsmasq.conf.ap

# Configuring the access point host software (hostapd)
cat hostapd_config >> /etc/hostapd/hostapd.config

# Configuring hostappd config path
sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapdp.conf"/g' /etc/default/hostapd

# Save old network interfaces and add new one
cp /etc/network/interfaces interfaces.wifi

