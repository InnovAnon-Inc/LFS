set -eo nounset

cd /sources

test -f libseccomp-2.3.2.tar.gz || \
wget --no-check-certificate \
	https://github.com/seccomp/libseccomp/releases/download/v2.3.2/libseccomp-2.3.2.tar.gz

rm -rf libseccomp-2.3.2
tar xf libseccomp-2.3.2.tar.gz
pushd  libseccomp-2.3.2

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf libseccomp-2.3.2
