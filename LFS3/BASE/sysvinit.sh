set -eo nounset
set +h

cd /sources

rm -rf sysvinit-2.88dsf
tar xf sysvinit-2.88dsf.tar.bz2
pushd  sysvinit-2.88dsf

patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch

make -C src

make -C src install

popd
rm -rf sysvinit-2.88dsf
