# Install required packages
apt-get install dnsmasq hostapd dhcpcd5
systemctl stop dnsmasq
systemctl stop hostapd

# Configure static ip
echo "denyinterface wlan0" >> /etc/dhcpcd.conf

service dhcpcd restart

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.old

cp dnsmasq.conf /etc/dnsmasq.conf

# Configuring the access point host software (hostapd)
cat hostapd.conf >> /etc/hostapd/hostapd.conf

# Configuring hostappd config path
sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/g' /etc/default/hostapd

# Save old network interfaces and add new one
cp /etc/network/interfaces interfaces.wifi

systemctl unmask hostapd.service
