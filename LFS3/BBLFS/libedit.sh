set -eo nounset

cd /sources

test -f libedit-20170329-3.1.tar.gz || \
wget --no-check-certificate \
	http://thrysoee.dk/editline/libedit-20170329-3.1.tar.gz

rm -rf libedit-20170329-3.1
tar xf libedit-20170329-3.1.tar.gz
pushd  libedit-20170329-3.1

autoreconf -fi
./configure --prefix=/usr
make
make install

popd
rm -rf libedit-20170329-3.1
