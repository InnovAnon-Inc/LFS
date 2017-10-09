set -eo nounset

cd /sources

rm -rf groff-1.22.3
tar xf groff-1.22.3.tar.gz
pushd  groff-1.22.3

PAGE=letter ./configure --prefix=/usr

make -j1

make install

popd
rm -rf groff-1.22.3
