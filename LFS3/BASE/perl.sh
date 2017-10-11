set -eo nounset

cd /sources

rm -rf perl-5.26.1
tar xf perl-5.26.1.tar.xz
pushd  perl-5.26.1

echo "127.0.0.1 localhost $(hostname)" > /etc/hosts

export BUILD_ZLIB=False
export BUILD_BZIP2=0

sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib                  \
                  -Dusethreads

make

#make -k test

make install
unset BUILD_ZLIB BUILD_BZIP2

popd
rm -rf perl-5.26.1
