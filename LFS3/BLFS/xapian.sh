set -eo nounset

cd /sources

test -f xapian-core-1.4.4.tar.xz || \
wget --no-check-certificate \
	http://oligarchy.co.uk/xapian/1.4.4/xapian-core-1.4.4.tar.xz

rm -rf xapian-core-1.4.4
tar xf xapian-core-1.4.4.tar.xz
pushd  xapian-core-1.4.4

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xapian-core-1.4.4 &&
make

make install

popd
rm -rf xapian-core-1.4.4
