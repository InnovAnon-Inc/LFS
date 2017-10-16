set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/autoconf/autoconf-2.65.tar.xz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf autoconf-2.65
tar xf autoconf-2.65.tar.xz
pushd  autoconf-2.65

#mv -v autoconf.texi autoconf-265.texi
#rm -v autoconf.info

./configure --prefix=/usr --program-suffix=-2.65
make

make install
#install -v -m644 autoconf-265.info /usr/share/info
#install-info --info-dir=/usr/share/info autoconf-265.info

popd
rm -rf autoconf-2.65

