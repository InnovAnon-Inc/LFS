set -eo nounset

cd /sources

test -f fcron-3.2.0.src.tar.gz || \
wget --no-check-certificate \
	http://fcron.free.fr/archives/fcron-3.2.0.src.tar.gz

rm -rf fcron-3.2.0
tar xf fcron-3.2.0.src.tar.gz
pushd  fcron-3.2.0

cat >> /etc/syslog.conf << "EOF"
# Begin fcron addition to /etc/syslog.conf

cron.* -/var/log/cron.log

# End fcron addition
EOF

/etc/rc.d/init.d/sysklogd reload || :

groupadd -g 22 fcron
useradd -d /dev/null -c "Fcron User" -g fcron -s /bin/false -u 22 fcron

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --localstatedir=/var   \
            --without-sendmail     \
            --with-boot-install=no \
            --with-systemdsystemunitdir=no
make

make install

popd
rm -rf fcron-3.2.0

