#!/bin/bash -xe

# Install iptables-persistent
sudo apt-get update
sudo echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
sudo echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
sudo apt-get -y install iptables-persistent

# Register Interface
sudo cat <<'EOF' > /etc/network/interfaces
auto ens5
iface ens5 inet static 
address 10.151.7.4 
netmask 255.255.255.224 
EOF

sudo apt-get -y install ifupdown
sudo ifdown ens5
sudo ifup ens5

# Enable IP routing
sudo sysctl -w net.ipv4.ip_forward=1
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

# Add routing infor for protected internal networks
sudo ip route add 10.151.7.96/27 via 10.151.7.65 dev ens6
sudo ip route add 10.151.7.128/27 via 10.151.7.65 dev ens6
sudo ip route add 10.151.7.160/27 via 10.151.7.65 dev ens6
sudo ip route add 10.151.8.0/24 via 10.151.7.65 dev ens6
sudo echo 'ip route add 10.151.7.96/27 via 10.151.7.65 dev ens6' >> /etc/rc.local
sudo echo 'ip route add 10.151.7.128/27 via 10.151.7.65 dev ens6' >> /etc/rc.local
sudo echo 'ip route add 10.151.7.160/27 via 10.151.7.65 dev ens6' >> /etc/rc.local
sudo echo 'ip route add 10.151.8.0/24 via 10.151.7.65 dev ens6' >> /etc/rc.local
sudo echo 'exit 0' >> /etc/rc.local

# Configure iptables
sudo iptables --flush
sudo iptables -t nat --flush
sudo iptables --delete-chain
sudo iptables -t nat --delete-chain
sudo iptables -A POSTROUTING -t nat -o ens5 -j MASQUERADE

# UTM 동작 시뮬레이션을 위한 Inbound NAT 추가 사항
#### 인바운드 통신 SNAT
# iptables -A POSTROUTING -t nat -o ens5 -j SNAT --to 10.0.1.70
# #### 웹 인바운드
# iptables -A PREROUTING -t nat -i ens5 -p tcp --dport 80 -j DNAT --to 10.0.1.140
# #### Non-웹 인바운드
# iptables -A PREROUTING -t nat -i ens5 -p tcp --dport 30000 -j DNAT --to 10.0.4.70:22
# iptables -A PREROUTING -t nat -i ens5 -p tcp --dport 30001 -j DNAT --to 10.0.4.100:22

# Save
sudo netfilter-persistent save

# UTM Health Check
## Install & Configure Nginx
# apt-get install -y nginx

# cat <<'EOF' > /etc/nginx/conf.d/default.conf
# server {
#   listen 8080;

#   location /hc {
#     access_log off;
#     return 200;
#     add_header Content-Type text/plain;
#   }
# }
# EOF

# systemctl restart nginx



