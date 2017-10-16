set -eo nounset

cd /sources

test -f initd-tools-0.1.3.tar.gz || \
wget --no-check-certificate \
	https://people.freedesktop.org/~dbn/initd-tools/releases/initd-tools-0.1.3.tar.gz

rm -rf initd-tools-0.1.3
tar xf initd-tools-0.1.3.tar.gz
pushd  initd-tools-0.1.3

./configure --prefix=/ --mandir=/usr/share/man &&
make

make install

popd
rm -rf initd-tools-0.1.3
