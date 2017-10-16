set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/rpcbind/rpcbind-0.2.4.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/rpcbind-0.2.4-vulnerability_fixes-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf rpcbind-0.2.4
tar xf rpcbind-0.2.4.tar.bz2
pushd  rpcbind-0.2.4

sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c

patch -Np1 -i ../rpcbind-0.2.4-vulnerability_fixes-1.patch &&

./configure --prefix=/usr                                  \
            --bindir=/sbin                                 \
            --with-rpcuser=root                            \
            --enable-warmstarts                            \
            --without-systemdsystemunitdir                 &&
make

make install

/workspace/LFS/LFS3/BLFS/bootscripts.sh rpcbind

popd
rm -rf rpcbind-0.2.4
