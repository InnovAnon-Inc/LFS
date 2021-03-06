set -eo nounset
set +h

cd /sources

rm -rf gawk-4.1.4
tar xf gawk-4.1.4.tar.xz
pushd  gawk-4.1.4

./configure --prefix=/usr

make

#make check

make install

mkdir -v /usr/share/doc/gawk-4.1.4
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.1.4

popd
rm -rf gawk-4.1.4
