set -eo nounset

cd /sources

for k in \
https://github.com/01org/libva/releases/download/1.8.3/libva-1.8.3.tar.bz2 \
https://github.com/01org/intel-vaapi-driver/releases/download/1.8.3/intel-vaapi-driver-1.8.3.tar.bz2 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf libva-1.8.3
tar xf libva-1.8.3.tar.bz2
pushd  libva-1.8.3

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf libva-1.8.3

rm -rf intel-vaapi-driver-1.8.3
tar xf intel-vaapi-driver-1.8.3.tar.bz2
pushd  intel-vaapi-driver-1.8.3

./configure $XORG_CONFIG &&
make

make install

popd
rm -rf intel-vaapi-driver-1.8.3
