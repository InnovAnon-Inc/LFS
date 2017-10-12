set -eo nounset

cd /sources

for k in \
http://invisible-mirror.net/archives/lynx/tarballs/lynx2.8.8rel.2.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/lynx-2.8.8rel.2-openssl_1.1.0-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf lynx2-8-8
tar xf lynx2.8.8rel.2.tar.bz2
pushd  lynx2-8-8

patch -p1 -i ../lynx-2.8.8rel.2-openssl_1.1.0-1.patch

./configure --prefix=/usr          \
            --sysconfdir=/etc/lynx \
            --datadir=/usr/share/doc/lynx-2.8.8rel.2 \
            --with-zlib            \
            --with-bzlib           \
            --with-ssl             \
            --with-screen=ncursesw \
            --enable-locale-charset
make

make install-full
chgrp -v -R root /usr/share/doc/lynx-2.8.8rel.2/lynx_doc

sed -e '/#LOCALE/     a LOCALE_CHARSET:TRUE'     \
    -i /etc/lynx/lynx.cfg

sed -e '/#DEFAULT_ED/ a DEFAULT_EDITOR:vi'       \
    -i /etc/lynx/lynx.cfg

sed -e '/#PERSIST/    a PERSISTENT_COOKIES:TRUE' \
    -i /etc/lynx/lynx.cfg

popd
rm -rf lynx2-8-8
