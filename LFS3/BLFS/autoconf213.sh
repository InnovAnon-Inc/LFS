set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/autoconf/autoconf-2.13.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/autoconf-2.13-consolidated_fixes-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf autoconf-2.13
tar xf autoconf-2.13.tar.gz
pushd  autoconf-2.13

patch -Np1 -i ../autoconf-2.13-consolidated_fixes-1.patch
mv -v autoconf.texi autoconf213.texi
rm -v autoconf.info
./configure --prefix=/usr --program-suffix=2.13
make

make install
install -v -m644 autoconf213.info /usr/share/info
install-info --info-dir=/usr/share/info autoconf213.info

popd
rm -rf autoconf-2.13

