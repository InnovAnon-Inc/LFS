set -eo nounset
set +h

cd /sources

rm -rf grep-3.1
tar xf grep-3.1.tar.xz
pushd  grep-3.1

./configure --prefix=/usr --bindir=/bin

make

#make check

make install

popd
rm -rf grep-3.1
