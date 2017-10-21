set -eo nounset

cd /other-repos || cd /repos

if [ -d musl ] ; then
	pushd musl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://git.musl-libc.org/musl
fi

cd musl

./configure \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2             \
      --with-headers=/tools/include      \
      libc_cv_forced_unwind=yes          \
      libc_cv_c_cleanup=yes
make
make install
