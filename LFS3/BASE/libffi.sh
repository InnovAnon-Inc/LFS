set -eo nounset

cd /sources

rm -rf libffi-3.2.1
tar xf libffi-3.2.1.tar.gz
pushd  libffi-3.2.1

sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in

./configure --prefix=/usr --disable-static

make

#make check

make install

popd
rm -rf libffi-3.2.1
