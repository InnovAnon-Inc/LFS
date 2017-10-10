set -eo nounset

cd /sources

test -f alsa-utils-1.1.4.tar.bz2 || \
wget --no-check-certificate \
	ftp://ftp.alsa-project.org/pub/utils/alsa-utils-1.1.4.tar.bz2

rm -rf alsa-utils-1.1.4
tar xf alsa-utils-1.1.4.tar.bz2
pushd  alsa-utils-1.1.4

./configure --disable-alsaconf \
            --disable-bat   \
            --disable-xmlto \
            --with-curses=ncursesw
make

make install

popd
rm -rf alsa-utils-1.1.4
