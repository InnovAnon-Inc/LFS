set -eo nounset

cd /sources

for k in \
http://ftp.gnome.org/pub/gnome/sources/libunique/1.1/libunique-1.1.6.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/libunique-1.1.6-upstream_fixes-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf libunique-1.1.6
tar xf libunique-1.1.6.tar.bz2
pushd  libunique-1.1.6

patch -Np1 -i ../libunique-1.1.6-upstream_fixes-1.patch &&
autoreconf -fi &&

./configure --prefix=/usr  \
            --disable-dbus \
            --disable-static &&
make


make install

popd
rm -rf libunique-1.1.6
