set -eo nounset
set +h

cd /sources

rm -rf gzip-1.8
tar xf gzip-1.8.tar.xz
pushd  gzip-1.8

./configure --prefix=/usr

make

#make check

make install

mv -v /usr/bin/gzip /bin

popd
rm -rf gzip-1.8
