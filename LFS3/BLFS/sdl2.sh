set -eo nounset

cd /sources

test -f SDL2-2.0.6.tar.gz || \
wget --no-check-certificate \
	http://www.libsdl.org/release/SDL2-2.0.6.tar.gz

rm -rf SDL2-2.0.6
tar xf SDL2-2.0.6.tar.gz
pushd  SDL2-2.0.6

./configure --prefix=/usr &&
make

#pushd docs  &&
#  doxygen   &&
#popd

make install              &&
rm -v /usr/lib/libSDL2*.a

install -v -m755 -d        /usr/share/doc/SDL2-2.0.6/html &&
cp -Rv  docs/output/html/* /usr/share/doc/SDL2-2.0.6/html

#cd test &&
#./configure &&
#make

popd
rm -rf SDL2-2.0.6
