cd /sources

test -f liblinear-211.tar.gz || \
wget --no-check-certificate \
	https://github.com/cjlin1/liblinear/archive/v211/liblinear-211.tar.gz

rm -rf liblinear-211
tar xf liblinear-211.tar.gz
cd liblinear-211

make lib

install -vm644 linear.h /usr/include
install -vm755 liblinear.so.3 /usr/lib
ln -sfv liblinear.so.3 /usr/lib/liblinear.so
