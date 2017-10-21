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

autoreconf-2.64 -fi 

mkdir -v build
cd       build

../configure --prefix=/tools            \
             --with-sysroot=$LFS        \
             --with-lib-path=/tools/lib \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror

make

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install

