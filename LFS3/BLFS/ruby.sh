set -eo nounset

cd /sources

test -f ruby-2.4.2.tar.xz || \
wget --no-check-certificate \
	http://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.xz

rm -rf ruby-2.4.2
tar xf ruby-2.4.2.tar.xz
pushd  ruby-2.4.2

./configure --prefix=/usr   \
            --enable-shared \
            --docdir=/usr/share/doc/ruby-2.4.2
make

make capi

make install

popd
rm -rf ruby-2.4.2

