set -eo nounset

cd /other-repos || cd /repos

if [ -d cmake ] ; then
	pushd cmake
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/Kitware/CMake.git cmake
fi

cd cmake

if `which cmake` ; then
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
	make install
else
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
fi

