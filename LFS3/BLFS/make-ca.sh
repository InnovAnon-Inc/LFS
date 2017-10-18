set -eo nounset

# requires openssl
cd /sources

MAKE_CA_VERSION=0.6

for k in  \
https://github.com/djlucas/make-ca/archive/v$MAKE_CA_VERSION/make-ca-$MAKE_CA_VERSION.tar.gz \
http://www.cacert.org/certs/root.crt \
http://www.cacert.org/certs/class3.crt ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done 

rm -rf make-ca-$MAKE_CA_VERSION
tar xf make-ca-$MAKE_CA_VERSION.tar.gz
pushd  make-ca-$MAKE_CA_VERSION

install -vdm755 /etc/ssl/local
#wget --no-check-certificate http://www.cacert.org/certs/root.crt
#wget --no-check-certificate http://www.cacert.org/certs/class3.crt
openssl x509 -in ../root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_1_root.pem
openssl x509 -in ../class3.crt -text -fingerprint -setalias "CAcert Class 3 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_3_root.pem

make install

/usr/sbin/make-ca -g

popd
rm -rf make-ca-$MAKE_CA_VERSION
