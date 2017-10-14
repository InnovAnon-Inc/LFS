set -eo nounset

cd /sources

for k in 
https://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz \
http://mirrors.cdn.adacore.com/art/591c6d80c7a447af2deed1d7 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

#rm -rf ?
#tar xf ?
#pushd ?

make ins-all prefix=/opt/gnat
exit 2

rm -rf gcc-7.2.0
tar xf gcc-7.2.0.tar.xz
pushd  gcc-7.2.0

PATH_HOLD=$PATH
export PATH=/opt/gnat/bin:$PATH_HOLD

find /opt/gnat -name ld -exec mv -v {} {}.old \;
find /opt/gnat -name as -exec mv -v {} {}.old \;

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir build
cd    build

../configure               \
    --prefix=/usr          \
    --disable-multilib     \
    --with-system-zlib     \
    --enable-languages=ada
make

#ulimit -s 32768
#make -k check

#../contrib/test_summary

make install
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/7.2.0/include{,-fixed} \
    /usr/lib/gcc/*linux-gnu/7.2.0/ada{lib,include}

rm -rf /opt/gnat

export PATH=$PATH_HOLD
unset PATH_HOLD

popd
rm -rf gcc-7.2.0

