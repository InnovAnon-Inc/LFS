set -eo nounset

cd /sources

test -f util-macros-1.19.1.tar.bz2 || \
wget --no-check-certificate \
	https://www.x.org/pub/individual/util/util-macros-1.19.1.tar.bz2

rm -rf util-macros-1.19.1
tar xf util-macros-1.19.1.tar.bz2
pushd  util-macros-1.19.1

./configure $XORG_CONFIG

make install

popd
rm -rf util-macros-1.19.1
