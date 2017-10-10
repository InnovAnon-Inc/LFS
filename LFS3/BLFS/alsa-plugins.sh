set -eo nounset

cd /sources

test -f alsa-plugins-1.1.4.tar.bz2 || \
wget --no-check-certificate \
	ftp://ftp.alsa-project.org/pub/plugins/alsa-plugins-1.1.4.tar.bz2

rm -rf alsa-plugins-1.1.4
tar xf alsa-plugins-1.1.4.tar.bz2
pushd  alsa-plugins-1.1.4

./configure
make

make install

popd
rm -rf alsa-plugins-1.1.4
