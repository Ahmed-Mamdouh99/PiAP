apt install isc-dhcp-server iptables
sed -i 's/INTERFACESv4=""/INTERFACESv4="wlan0"/g' /etc/default/isc-dhcp-server
echo 'INTERFACES="wlan0"' > /etc/default/dhcpcd.conf
cp /etc/dhcp/dhcpd.conf > dhcpd.conf.origin
cat dhcpd.conf.pre /etc/dhcp/dhcpd.conf dhcpd.conf.post > /etc/dhcp/dhcpd.conf.ap
cp /etc/network/interfaces interfaces.wifi
cat interfaces.wifi interfaces.ap.append > interfaces.ap
# cp /etc/dhcpcd.conf dhcpcd.conf.wifi
sh -c 'iptables-save > /etc/iptables.ipv4.nat'
