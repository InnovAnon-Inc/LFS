set -eo nounset
set +h

cd /sources

rm -rf lfs-bootscripts-20170626
tar xf lfs-bootscripts-20170626.tar.bz2
pushd  lfs-bootscripts-20170626

make install

popd
rm -rf lfs-bootscripts-20170626
