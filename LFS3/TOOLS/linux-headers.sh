set -eo nounset

cd /mnt/lfs/sources

rm -rf linux-4.13.3
tar xf linux-4.13.3.tar.xz
pushd  linux-4.13.3

make mrproper

make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

popd
rm -rf linux-4.13.3
