set -eo nounset

# requires openssl
cd /sources

MAKE_CA_VERSION=0.6

test -f make-ca-$MAKE_CA_VERSION.tar.gz || \
wget --no-check-certificate \
	https://github.com/djlucas/make-ca/archive/v$MAKE_CA_VERSION/make-ca-$MAKE_CA_VERSION.tar.gz

rm -rf make-ca-$MAKE_CA_VERSION
tar xf make-ca-$MAKE_CA_VERSION.tar.gz
pushd  make-ca-$MAKE_CA_VERSION

install -vdm755 /etc/ssl/local
test -f root.crt || \
wget --no-check-certificate http://www.cacert.org/certs/root.crt
test -f class3.crt || \
wget --no-check-certificate http://www.cacert.org/certs/class3.crt
openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_1_root.pem
openssl x509 -in class3.crt -text -fingerprint -setalias "CAcert Class 3 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_3_root.pem

make install

/usr/sbin/make-ca -g

popd
rm -rf make-ca-$MAKE_CA_VERSION
