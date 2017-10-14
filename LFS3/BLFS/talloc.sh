set -eo nounset

cd /sources

test -f talloc-2.1.10.tar.gz || \
wget --no-check-certificate \
	https://www.samba.org/ftp/talloc/talloc-2.1.10.tar.gz

rm -rf talloc-2.1.10
tar xf talloc-2.1.10.tar.gz
pushd  talloc-2.1.10

./configure --prefix=/usr
make

make install

popd
rm -rf talloc-2.1.10

