set -eo nounset

cd /sources

test -f gpgme-1.9.0.tar.bz2 || \
wget --no-check-certificate \
	https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.9.0.tar.bz2

rm -rf gpgme-1.9.0
tar xf gpgme-1.9.0.tar.bz2
pushd  gpgme-1.9.0

./configure --prefix=/usr &&
make

make install

popd
rm -rf gpgme-1.9.0
