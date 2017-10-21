set -eo nounset

cd /other-repos || cd /repos

if [ -d uclibc-ng ] ; then
	pushd uclibc-ng
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://uclibc-ng.org/uclibc-ng
fi

cd uclibc-ng

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
