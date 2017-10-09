set -eo nounset

cd /sources

rm -rf check-0.11.0
tar xf check-0.11.0.tar.gz
pushd  check-0.11.0

PKG_CONFIG= ./configure --prefix=/tools

make

#make check

make install

popd
rm -rf check-0.11.0
