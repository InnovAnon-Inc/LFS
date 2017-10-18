set -eo nounset

cd /sources

test -f xfsprogs-4.13.1.tar.xz || 
wget --no-check-certificate \
	 https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-4.13.1.tar.xz

rm -rf xfsprogs-4.13.1
tar xf xfsprogs-4.13.1.tar.xz
pushd  xfsprogs-4.13.1

make DEBUG=-DNDEBUG     \
     INSTALL_USER=root  \
     INSTALL_GROUP=root \
     LOCAL_CONFIGURE_OPTIONS="--enable-readline"

make PKG_DOC_DIR=/usr/share/doc/xfsprogs-4.13.1 install     &&
make PKG_DOC_DIR=/usr/share/doc/xfsprogs-4.13.1 install-dev &&

rm -rfv /usr/lib/libhandle.a                               &&
rm -rfv /lib/libhandle.{a,la,so}                           &&
ln -sfv ../../lib/libhandle.so.1 /usr/lib/libhandle.so     &&
sed -i "s@libdir='/lib@libdir='/usr/lib@" /usr/lib/libhandle.la

popd
rm -rf xfsprogs-4.13.1
