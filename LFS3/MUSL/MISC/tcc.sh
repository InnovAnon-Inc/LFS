set -eo nounset

cd /other-repos || cd /repos

if [ ! -f /usr/local/musl/bin/tcc ] ; then
if [ -d tinycc ] ; then
	pushd tinycc
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://repo.or.cz/tinycc.git
fi
fi

cd tinycc

if [ ! -f /usr/local/musl/bin/tcc ] ; then
./configure \
	--prefix=/usr/local/musl \
	--sysroot=/usr/local/musl \
	--cc=/usr/local/musl/bin/musl-gcc \
	--enable-cross \
	--config-musl \
	--strip-binaries
make
make install
fi

echo TODO
exit 2
#./configure \
#	--prefix=/opt/tcc \
#	--sysroot=/usr/local/musl \
#	--cc=/usr/local/musl/bin/tcc \
#	--sysincludepaths=/usr/local/musl/include \
#	--libpaths=/usr/local/musl/lib \
#	--enable-cross \
#	--config-musl \
#	--strip-binaries
#./configure \
#	--prefix=/usr/local/musl \
#	--sysroot=/usr/local/musl \
#	--cc=/usr/local/musl/bin/tcc \
#	--enable-cross \
#	--config-musl \
#	--strip-binaries
#make
#make install
