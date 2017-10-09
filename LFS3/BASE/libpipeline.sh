set -eo nounset

cd /sources

rm -rf libpipeline-1.4.2
tar xf libpipeline-1.4.2.tar.gz
pushd  libpipeline-1.4.2

PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr

make

#make check

make install

popd
rm -rf libpipeline-1.4.2
