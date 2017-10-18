set -eo nounset

cd /sources

test -f libdaemon-0.14.tar.gz || \
wget --no-check-certificate \
	http://0pointer.de/lennart/projects/libdaemon/libdaemon-0.14.tar.gz

rm -rf libdaemon-0.14
pushd libdaemon-0.14.tar.gz
pushd  libdaemon-0.14

./configure --prefix=/usr --disable-static &&
make

if which doxygen ; then
make -C doc doxygen
fi

make docdir=/usr/share/doc/libdaemon-0.14 install

install -v -m755 -d /usr/share/doc/libdaemon-0.14/api &&
install -v -m644 doc/reference/html/* /usr/share/doc/libdaemon-0.14/api &&
install -v -m644 doc/reference/man/man3/* /usr/share/man/man3

popd
rm -rf libdaemon-0.14
