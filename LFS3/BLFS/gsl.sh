set -eo nounset

cd /sources

test -f gsl-2.4.tar.gz || \
wget --no-check-certificate \
	https://ftp.gnu.org/gnu/gsl/gsl-2.4.tar.gz

rm -rf gsl-2.4
tar xf gsl-2.4.tar.gz
pushd  gsl-2.4

./configure --prefix=/usr --disable-static
make

make html

make install

mkdir                   /usr/share/doc/gsl-2.4
cp -R doc/_build/html/* /usr/share/doc/gsl-2.4

popd
rm -rf gsl-2.4

