set -eo nounset

test -f npth-1.5.tar.bz2 || \
wget --no-check-certificate \
	https://www.gnupg.org/ftp/gcrypt/npth/npth-1.5.tar.bz2

rm -rf npth-1.5
tar xf npth-1.5.tar.bz2
pushd  npth-1.5

./configure --prefix=/usr &&
make

make install

popd
rm -rf npth-1.5
