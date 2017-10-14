set -eo nounset

cd /sources

test -f sharutils-4.15.2.tar.xz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/sharutils/sharutils-4.15.2.tar.xz

rm -rf sharutils-4.15.2
tar xf sharutils-4.15.2.tar.xz
pushd  sharutils-4.15.2

./configure --prefix=/usr
make

make install

popd
rm -rf sharutils-4.15.2

