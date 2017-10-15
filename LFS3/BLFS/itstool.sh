set -eo nounset

cd /sources

test -f itstool-2.0.2.tar.bz2 || \
wget --no-check-certificate \
	http://files.itstool.org/itstool/itstool-2.0.2.tar.bz2

rm -rf itstool-2.0.2
tar xf itstool-2.0.2.tar.bz2
pushd  itstool-2.0.2

./configure --prefix=/usr &&
make

make install

popd
rm -rf itstool-2.0.2
