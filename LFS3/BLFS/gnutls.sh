set -eo nounset

cd /sources

test -f gnutls-3.6.0.tar.xz || \
wget --no-check-certificate \
	https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.0.tar.xz

rm -rf gnutls-3.6.0
tar xf gnutls-3.6.0.tar.xz
pushd  gnutls-3.6.0

./configure --prefix=/usr \
            --with-default-trust-store-pkcs11="pkcs11:"
make

make install

make -C doc/reference install-data-local

popd
rm -rf gnutls-3.6.0

