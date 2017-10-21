set -eo nounset

cd /other-repos || cd /repos

if [ -d binutils ] ; then
	pushd binutils
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://sourceware.org/git/binutils.git
fi

cd binutils

autoreconf -fi
CC=/usr/local/musl/bin/musl-gcc \
./configure \
	--prefix=/usr/local/musl \
	--with-sysroot=/usr/local/musl \
	--disable-nls \
	--disable-werror \
	--with-lib-path=/usr/local/musl/lib
make
make install

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac


