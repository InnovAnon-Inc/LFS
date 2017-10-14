set -eo nounset

cd /sources

for k in \
http://anduin.linuxfromscratch.org/BLFS/net-tools/net-tools-CVS_20101030.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/net-tools-CVS_20101030-remove_dups-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf net-tools-CVS_20101030
tar xf net-tools-CVS_20101030.tar.gz
pushd  net-tools-CVS_20101030

patch -Np1 -i ../net-tools-CVS_20101030-remove_dups-1.patch
sed -i '/#include <netinet\/ip.h>/d'  iptunnel.c

yes "" | make config
make

make update

popd
rm -rf net-tools-CVS_20101030

