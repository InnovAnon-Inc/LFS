set -eo nounset

cd /sources

rm -rf autoconf-2.69
tar xf autoconf-2.69.tar.xz
pushd  autoconf-2.69

./configure --prefix=/usr

make

#make check

make install

popd
rm -rf autoconf-2.69
