set -eo nounset

cd /sources

test -f pinentry-1.0.0.tar.bz2 || \
wget --no-check-certificate \
	https://www.gnupg.org/ftp/gcrypt/pinentry/pinentry-1.0.0.tar.bz2

rm -rf pinentry-1.0.0
tar xf pinentry-1.0.0.tar.bz2
pushd  pinentry-1.0.0

./configure --prefix=/usr &&
make

make install

popd
rm -rf pinentry-1.0.0
