# requires openssl
cd /sources

test -f make-ca-0.5.tar.gz || \
wget --no-check-certificate \
	https://github.com/djlucas/make-ca/archive/v0.5/make-ca-0.5.tar.gz

rm -rf make-ca-0.5
tar xf make-ca-0.5.tar.gz
cd     make-ca-0.5

install -vdm755 /etc/ssl/local
wget http://www.cacert.org/certs/root/root.crt
wget http://www.cacert.org/certs/root/class3.crt
openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_1_root.pem
openssl x509 -in class3.crt -text -fingerprint -setalias "CAcert Class 3 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_3_root.pem

make install

/usr/sbin/make-ca -g
