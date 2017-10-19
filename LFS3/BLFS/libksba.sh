set -eo nounset

cd /sources

test -f libksba-1.3.5.tar.bz2 || \
wget --no-check-certificate \
	 https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.5.tar.bz2

rm -rf libksba-1.3.5
tar xf libksba-1.3.5.tar.bz2
pushd  libksba-1.3.5

./configure --prefix=/usr &&
make

make install

popd
rm -rf libksba-1.3.5
