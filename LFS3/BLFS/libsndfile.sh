set -eo nounset

cd /sources

test -f libsndfile-1.0.28.tar.gz || \
wget --no-check-certificate \
	http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz

rm -rf libsndfile-1.0.28
tar xf libsndfile-1.0.28.tar.gz
pushd  libsndfile-1.0.28

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libsndfile-1.0.28 &&
make

make install

popd
rm -rf libsndfile-1.0.28
