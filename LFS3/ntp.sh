cd /sources

test -f ntp-4.2.8p10.tar.gz || \
wget --no-check-certificate \
	 https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p10.tar.gz

rm -rf ntp-4.2.8p10
tar xf ntp-4.2.8p10.tar.gz
cd ntp-4.2.8p10

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
