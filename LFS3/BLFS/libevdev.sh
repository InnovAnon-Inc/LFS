set -eo nounset

cd /sources

test -f libevdev-1.2.2.tar.xz || \
wget --no-check-certificate \
	 http://www.freedesktop.org/software/libevdev/libevdev-1.2.2.tar.xz

rm -rf libevdev-1.2.2
tar xf libevdev-1.2.2.tar.xz
pushd  libevdev-1.2.2

cat >> test/valgrind.suppressions << "EOF"
{
   <timer_create@@GLIBC_2.3.3-2>
   Memcheck:Param
   timer_create(evp)
   fun:timer_create@@GLIBC_2.3.3
   fun:check_get_clockid
   fun:srunner_run
   fun:main
}
EOF

./configure --prefix=/usr --disable-static
make

make install

popd
rm -rf libevdev-1.2.2
