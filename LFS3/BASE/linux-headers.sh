set -eo nounset
set +h

cd /sources

#

rm -rf linux-4.13.3
tar xf linux-4.13.3.tar.xz
pushd  linux-4.13.3

make mrproper

make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

popd
rm -rf linux-4.13.3
