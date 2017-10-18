set -eo nounset

cd /sources

test -f SDL-1.2.15.tar.gz || \
wget --no-check-certificate \
	http://www.libsdl.org/release/SDL-1.2.15.tar.gz

rm -rf SDL-1.2.15
tar xf SDL-1.2.15.tar.gz
pushd  SDL-1.2.15

sed -e '/_XData32/s:register long:register _Xconst long:' \
    -i src/video/x11/SDL_x11sym.h &&

./configure --prefix=/usr --disable-static &&

make

make install &&

install -v -m755 -d /usr/share/doc/SDL-1.2.15/html &&
install -v -m644    docs/html/*.html \
                    /usr/share/doc/SDL-1.2.15/html

#cd test &&
#./configure &&
#make

popd
rm -rf SDL-1.2.15
