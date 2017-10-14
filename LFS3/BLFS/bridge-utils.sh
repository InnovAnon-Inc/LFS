set -eo nounset

cd /sources

test -f bridge-utils-1.6.tar.xz || \
wget --no-check-certificate \
	https://www.kernel.org/pub/linux/utils/net/bridge-utils/bridge-utils-1.6.tar.xz

rm -rf bridge-utils-1.6
tar xf bridge-utils-1.6.tar.xz
pushd  bridge-utils-1.6

autoconf                  &&
./configure --prefix=/usr &&
make

make install

#make install-service-bridge
/workspace/LFS/LFS3/BLFS/bootscripts.sh service-bridge

cat > /etc/sysconfig/ifconfig.br0 << "EOF"
ONBOOT=yes
IFACE=br0
SERVICE="bridge ipv4-static"  # Space separated
IP=192.168.1.32
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
CHECK_LINK=no                 # Don't check before bridge is created
STP=no                        # Spanning tree protocol, default no
INTERFACE_COMPONENTS="eth0"   # Add to IFACE, space separated devices
IP_FORWARD=true
EOF

popd
rm -rf bridge-utils-1.6
