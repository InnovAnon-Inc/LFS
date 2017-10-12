set -eo nounset

cd /sources

test -f shared-mime-info-1.9.tar.xz || \
wget --no-check-certificate \
	https://people.freedesktop.org/~hadess/shared-mime-info-1.9.tar.xz

rm -rf shared-mime-info-1.9
tar xf shared-mime-info-1.9.tar.xz
pushd  shared-mime-info-1.9

./configure --prefix=/usr
make

make install

popd
rm -rf shared-mime-info-1.9
