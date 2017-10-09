set -eo nounset

# requires make-ca, openssl
cd /sources

test -f wget-1.19.1.tar.xz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/wget/wget-1.19.1.tar.xz

rm -rf wget-1.19.1
tar xf wget-1.19.1.tar.xz
pushd     wget-1.19.1

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --with-ssl=openssl
make

make install

popd
rm -rf wget-1.19.1
