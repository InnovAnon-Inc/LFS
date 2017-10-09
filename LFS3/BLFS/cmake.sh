set -eo nounset

cd /sources

test -f cmake-3.9.3.tar.gz || \
wget --no-check-certificate \
	https://cmake.org/files/v3.9/cmake-3.9.3.tar.gz

rm -rf cmake-3.9.3
tar xf cmake-3.9.3.tar.gz
pushd  cmake-3.9.3

sed -i '/CMAKE_USE_LIBUV 1/s/1/0/' CMakeLists.txt
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake

./bootstrap --prefix=/usr        \
            --system-libs        \
            --mandir=/share/man  \
            --no-system-jsoncpp  \
            --no-system-librhash \
            --docdir=/share/doc/cmake-3.9.3
make

make install

popd
rm -rf cmake-3.9.3
