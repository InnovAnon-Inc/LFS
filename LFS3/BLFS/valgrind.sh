set -eo nounset

cd /sources

test -f valgrind-3.13.0.tar.bz2 || \
wget --no-check-certificate \
	https://sourceware.org/ftp/valgrind/valgrind-3.13.0.tar.bz2

rm -rf valgrind-3.13.0
tar xf valgrind-3.13.0.tar.bz2
pushd valgrind-3.13.0

sed -i '1904s/4/5/' coregrind/m_syswrap/syswrap-linux.c

sed -i 's|/doc/valgrind||' docs/Makefile.in

./configure --prefix=/usr \
            --datadir=/usr/share/doc/valgrind-3.13.0
make

#ln -sfv ld-2.26.so.dbg /lib/ld-linux-x86-64.so.2

sed -e 's@prereq:.*@prereq: false@' \
    -i {helgrind,drd}/tests/pth_cond_destroy_busy.vgtest

make install

popd
rm -rf valgrind-3.13.0
