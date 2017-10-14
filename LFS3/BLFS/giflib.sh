set -eo nounset

cd /sources

test -f giflib-5.1.4.tar.bz2 || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/giflib/giflib-5.1.4.tar.bz2

rm -rf giflib-5.1.4
tar xf giflib-5.1.4.tar.bz2
pushd  giflib-5.1.4

./configure --prefix=/usr --disable-static
make

make install

find doc \( -name Makefile\* -o -name \*.1 \
         -o -name \*.xml \) -exec rm -v {} \;

install -v -dm755 /usr/share/doc/giflib-5.1.4
cp -v -R doc/* /usr/share/doc/giflib-5.1.4

popd
rm -rf giflib-5.1.4

