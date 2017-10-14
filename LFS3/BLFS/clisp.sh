set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/clisp/latest/clisp-2.49.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/clisp-2.49-readline7_fixes-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf clisp-2.49
tar xf clisp-2.49.tar.bz2
pushd  clisp-2.49

sed -i -e '/socket/d' -e '/"streams"/d' tests/tests.lisp

patch -Np1 -i ../clisp-2.49-readline7_fixes-1.patch

mkdir build
cd    build

../configure --srcdir=../                       \
             --prefix=/usr                      \
             --docdir=/usr/share/doc/clisp-2.49 \
             --with-libsigsegv-prefix=/usr

ulimit -s 16384
make -j1

make install

popd
rm -rf clisp-2.49

