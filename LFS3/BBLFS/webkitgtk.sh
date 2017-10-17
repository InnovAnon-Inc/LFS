set -eo nounset

cd /sources

test -f webkitgtk-2.18.0.tar.xz || \
wget --no-check-certificate \
	https://webkitgtk.org/releases/webkitgtk-2.18.0.tar.xz

rm -rf webkitgtk-2.18.0
tar xf webkitgtk-2.18.0.tar.xz
pushd  webkitgtk-2.18.0

./autogen.sh
./configure
make
make install

popd
rm -rf webkitgtk-2.18.0
