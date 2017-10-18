set -eo nounset

cd /sources

test -f lame-3.99.5.tar.gz || \
wget --no-check-certificate \
	https://downloads.sourceforge.net/lame/lame-3.99.5.tar.gz

rm -rf lame-3.99.5
tar xf lame-3.99.5.tar.gz
pushd  lame-3.99.5

case $(uname -m) in
   i?86) sed -i -e '/xmmintrin\.h/d' configure ;;
esac

./configure --prefix=/usr --enable-mp3rtp --disable-static &&
make

make pkghtmldir=/usr/share/doc/lame-3.99.5 install

popd
rm -rf lame-3.99.5
