set -eo nounset
set +h

cd /sources

rm -rf zlib-1.2.11
tar xf zlib-1.2.11.tar.xz
pushd  zlib-1.2.11

./configure --prefix=/usr

make

#make check

make install

mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

popd
rm -rf zlib-1.2.11
