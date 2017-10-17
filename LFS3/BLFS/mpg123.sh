set -eo nounset

cd /sources

test -f mpg123-1.25.6.tar.bz2 || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/mpg123/mpg123-1.25.6.tar.bz2

rm -rf mpg123-1.25.6
tar xf mpg123-1.25.6.tar.bz2
pushd  mpg123-1.25.6

./configure --prefix=/usr &&
make

make install

popd
rm -rf mpg123-1.25.6
