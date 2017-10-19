set -eo nounset

cd /sources

test -f mawk.tar.gz || \
wget --no-check-certificate \
	http://invisible-island.net/datafiles/release/mawk.tar.gz

rm -rf mawk-1.3.4-20161120
tar xf mawk.tar.gz
pushd  mawk-1.3.4-20161120

autoreconf -fi
./configure
make
make install

rm -rf mawk-1.3.4-20161120
