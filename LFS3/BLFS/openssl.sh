set -eo nounset

cd /sources

test -f openssl-1.1.0f.tar.gz || \
wget --no-check-certificate \
	https://openssl.org/source/openssl-1.1.0f.tar.gz

rm -rf openssl-1.1.0f
tar xf openssl-1.1.0f.tar.gz
pushd  openssl-1.1.0f

./config --prefix=/usr \
         --openssldir=/etc/ssl \
         --libdir=lib \
         shared \
         zlib-dynamic
make

make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl{,-1.1.0f}
cp -vfr doc/* /usr/share/doc/openssl-1.1.0f

cd ..
rm -rf openssl-1.1.0f

popd
rm -rf openssl-1.1.0f
