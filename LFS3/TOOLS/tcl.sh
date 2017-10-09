set -eo nounset

cd /sources

rm -rf tcl8.6.7
tar xf tcl-core8.6.7-src.tar.gz
pushd  tcl8.6.7

cd unix
./configure --prefix=/tool

make

#TZ=UTC make test

make install

chmod -v u+w /tools/lib/libtcl8.6.so

make install-private-headers

ln -sv tclsh8.6 /tools/bin/tclsh

popd
rm -rf tcl8.6.7
