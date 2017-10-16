set -eo nounset

cd /sources

test -f wv-1.2.9.tar.gz || \
wget --no-check-certificate \
	http://www.abisource.com/downloads/wv/1.2.9/wv-1.2.9.tar.gz

rm -rf wv-1.2.9
tar xf wv-1.2.9.tar.gz
pushd  wv-1.2.9

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf wv-1.2.9
