set -eo nounset
set +h

cd /etc/sysconfig/
test -e ifconfig.eth0 || \
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.70
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF

test -e /etc/resolv.conf || \
cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

domain innovanon.com
nameserver 8.8.8.8
nameserver 8.8.4.4

# End /etc/resolv.conf
EOF

test -e /etc/hostname || \
echo "1980sLT" > /etc/hostname

test -e /etc/hosts || \
cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1    localhost
127.0.1.1    1980sLT.innovanon.com 1980sLT
192.168.1.70 1980sLT.innovanon.com 1980sLT
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF

