set -eo nounset

cd /sources

test -f nickle-2014-08-29.tar.bz2 || \
wget --no-check-certificate \
	http://nickle.org/snapshots/nickle-2014-08-29.tar.bz2

rm -rf nickle-2014-08-29
tar xf nickle-2014-08-29.tar.bz2
pushd  nickle-2014-08-29

./autogen.sh
./configure
make
make install

popd
rm -rf nickle-2014-08-29
