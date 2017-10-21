set -eo nounset

cd /other-repos || cd /repos

if [ ! -f /usr/local/musl/bin/musl-gcc ] ; then
if [ -d musl ] ; then
	pushd musl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://git.musl-libc.org/musl
fi
fi

cd musl

if [ ! -f /usr/local/musl/bin/musl-gcc ] ; then
./configure
make
make install
fi

git reset --hard
git clean -d -f -x
git checkout .

CC=/usr/local/musl/bin/musl-gcc \
CFLAGS=-static \
./configure \
	--prefix=/opt/musl-static \
	--sysroot=/usr/local/musl
make
make install	
