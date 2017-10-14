set -eo nounset

cd /sources

for k in \
ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.26.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/cyrus-sasl-2.1.26-fixes-3.patch \
http://www.linuxfromscratch.org/patches/blfs/svn/cyrus-sasl-2.1.26-openssl-1.1.0-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf cyrus-sasl-2.1.26
tar xf cyrus-sasl-2.1.26.tar.gz
pushd  cyrus-sasl-2.1.26

patch -Np1 -i ../cyrus-sasl-2.1.26-fixes-3.patch
patch -Np1 -i ../cyrus-sasl-2.1.26-openssl-1.1.0-1.patch
autoreconf -fi

./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --enable-auth-sasldb \
            --with-dbpath=/var/lib/sasl/sasldb2 \
            --with-saslauthd=/var/run/saslauthd
make

make install
install -v -dm755 /usr/share/doc/cyrus-sasl-2.1.26
install -v -m644  doc/{*.{html,txt,fig},ONEWS,TODO} \
    saslauthd/LDAP_SASLAUTHD /usr/share/doc/cyrus-sasl-2.1.26
install -v -dm700 /var/lib/sasl

#make install-saslauthd
/workspace/LFS/LFS3/BLFS/bootscripts.sh saslauthd

popd
rm -rf cyrus-sasl-2.1.26

