set -eo nounset

cd /sources

test -f alsa-oss-1.0.28.tar.bz2 || \
wget --no-check-certificate \
	ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-1.0.28.tar.bz2

rm -rf alsa-oss-1.0.28
tar xf alsa-oss-1.0.28.tar.bz2
pushd  alsa-oss-1.0.28

./configure --disable-static
make

make install

popd
rm -rf alsa-oss-1.0.28

