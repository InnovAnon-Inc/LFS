set -eo nounset

cd /sources

test -f dosfstools-4.1.tar.xz || \
wget --no-check-certificate \
	https://github.com/dosfstools/dosfstools/releases/download/v4.1/dosfstools-4.1.tar.xz

rm -rf dosfstools-4.1
tar xf dosfstools-4.1.tar.xz
pushd  dosfstools-4.1

./configure --prefix=/               \
            --enable-compat-symlinks \
            --mandir=/usr/share/man  \
            --docdir=/usr/share/doc/dosfstools-4.1 &&
make

make install

popd
rm -rf dosfstools-4.1
