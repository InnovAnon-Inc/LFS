set -eo nounset

cd /sources

test -f p11-kit-0.23.9.tar.gz || \
wget --no-check-certificate \
	https://github.com/p11-glue/p11-kit/releases/download/0.23.9/p11-kit-0.23.9.tar.gz

rm -rf p11-kit-0.23.9
tar xf p11-kit-0.23.9.tar.gz
pushd  p11-kit-0.23.9

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-trust-paths=/etc/pki/anchors
make

make install

if [ -e /usr/lib/libnssckbi.so ]; then
  readlink /usr/lib/libnssckbi.so ||
  rm -v /usr/lib/libnssckbi.so    &&
  ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
fi

popd
rm -rf p11-kit-0.23.9

