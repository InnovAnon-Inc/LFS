cd /sources

test -f libevent-2.1.8-stable.tar.gz || \
wget --no-check-certificate \
	https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz

rm -rf libevent-2.1.8-stable
tar xf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable

./configure --prefix=/usr --disable-static
make

make install

install -v -m755 -d /usr/share/doc/libevent-2.1.8/api
cp      -v -R       doxygen/html/* \
                    /usr/share/doc/libevent-2.1.8/api
