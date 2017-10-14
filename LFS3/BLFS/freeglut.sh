set -eo nounset

cd /sources

test -f freeglut-3.0.0.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/freeglut/freeglut-3.0.0.tar.gz

rm -rf freeglut-3.0.0
tar xf freeglut-3.0.0.tar.gz
pushd  freeglut-3.0.0

mkdir build
cd    build

cmake -DCMAKE_INSTALL_PREFIX=/usr      \
      -DCMAKE_BUILD_TYPE=Release       \
      -DFREEGLUT_BUILD_DEMOS=OFF       \
      -DFREEGLUT_BUILD_STATIC_LIBS=OFF \
      ..

make

make install

popd
rm -rf freeglut-3.0.0
