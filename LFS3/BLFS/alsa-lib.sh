set -eo nounset

cd /sources

test -f alsa-lib-1.1.4.1.tar.bz2 || \
wget --no-check-certificate \
	ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.4.1.tar.bz2

rm -rf alsa-lib-1.1.4.1
tar xf alsa-lib-1.1.4.1.tar.bz2
pushd  alsa-lib-1.1.4.1

./configure
make

make doc

make install

install -v -d -m755 /usr/share/doc/alsa-lib-1.1.4.1/html/search
install -v -m644 doc/doxygen/html/*.* \
                /usr/share/doc/alsa-lib-1.1.4.1/html
install -v -m644 doc/doxygen/html/search/* \
                /usr/share/doc/alsa-lib-1.1.4.1/html/search

popd
rm -rf alsa-lib-1.1.4.1
