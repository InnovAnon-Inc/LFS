set -eo nounset

cd /sources

test -f flac-1.3.2.tar.xz || \
wget --no-check-certificate \
	https://downloads.xiph.org/releases/flac/flac-1.3.2.tar.xz

rm -rf flac-1.3.2
tar xf flac-1.3.2.tar.xz
pushd  flac-1.3.2

./configure --prefix=/usr \
            --disable-thorough-tests &&
make

make install

popd
rm -rf flac-1.3.2
