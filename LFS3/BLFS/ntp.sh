set -eo nounset

cd /sources

test -f ntp-4.2.8p10.tar.gz || \
wget --no-check-certificate \
	 https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p10.tar.gz

rm -rf ntp-4.2.8p10
tar xf ntp-4.2.8p10.tar.gz
pushd  ntp-4.2.8p10

groupadd -g 87 ntp
useradd -c "Network Time Protocol" -d /var/lib/ntp -u 87 \
        -g ntp -s /bin/false ntp

sed -e "s/https/http/"              \
    -e 's/"(\\S+)"/"?([^\\s"]+)"?/' \
    -i scripts/update-leap/update-leap.in

./configure CFLAGS="-O2 -g -fPIC" \
            --prefix=/usr         \
            --bindir=/usr/sbin    \
            --sysconfdir=/etc     \
            --enable-linuxcaps    \
            --with-lineeditlibs=readline \
            --docdir=/usr/share/doc/ntp-4.2.8p10
make

make install
install -v -o ntp -g ntp -d /var/lib/ntp

test -e /etc/ntp.conf || \
cat > /etc/ntp.conf << "EOF"
# Asia
#server 0.asia.pool.ntp.org

# Australia
#server 0.oceania.pool.ntp.org

# Europe
#server 0.europe.pool.ntp.org

# North America
server 0.north-america.pool.ntp.org

# South America
#server 2.south-america.pool.ntp.org

driftfile /var/lib/ntp/ntp.drift
pidfile   /var/run/ntpd.pid

leapfile  /etc/ntp.leapseconds
EOF

cat >> /etc/ntp.conf << "EOF"
# Security session
restrict    default limited kod nomodify notrap nopeer noquery
restrict -6 default limited kod nomodify notrap nopeer noquery

restrict 127.0.0.1
restrict ::1
EOF

/workspace/LFS/LFS3/BLFS/bootscripts.sh ntpd

#ntpd -q

ln -v -sf ../init.d/setclock /etc/rc.d/rc0.d/K46setclock &&
ln -v -sf ../init.d/setclock /etc/rc.d/rc6.d/K46setclock

popd
rm -rf ntp-4.2.8p10
