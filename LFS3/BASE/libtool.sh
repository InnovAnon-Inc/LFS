set -eo nounset
set +h

cd /sources

rm -rf libtool-2.4.6
tar xf libtool-2.4.6.tar.xz
pushd  libtool-2.4.6

./configure --prefix=/usr

make

#make check

make install

popd
rm -rf libtool-2.4.6
