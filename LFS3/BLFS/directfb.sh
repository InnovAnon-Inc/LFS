set -eo nounset

cd /sources

test -f DirectFB-1.6.3.tar.gz || \
wget --no-check-certificate \
	http://pkgs.fedoraproject.org/repo/pkgs/directfb/DirectFB-1.6.3.tar.gz/641e8e999c017770da647f9b5b890906/DirectFB-1.6.3.tar.gz

rm -rf DirectFB-1.6.3
tar xf DirectFB-1.6.3.tar.gz
pushd  DirectFB-1.6.3

#./configure --enable-static --enable-multi
./configure
make
make install

popd
rm -rf DirectFB-1.6.3
