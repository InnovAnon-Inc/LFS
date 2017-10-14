set -eo nounset

test $# -eq 1

cd /sources

test -f blfs-bootscripts-20170731.tar.xz || \
wget --no-check-certificate \
	 http://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20170731.tar.xz

rm -rf blfs-bootscripts-20170731
tar xf blfs-bootscripts-20170731.tar.xz
pushd  blfs-bootscripts-20170731

make install-$1

popd
rm -rf blfs-bootscripts-20170731
