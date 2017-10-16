set -eo nounset

cd /sources

test -f lm_sensors-3.4.0.tar.bz2 || \
wget --no-check-certificate \
	https://ftp.gwdg.de/pub/linux/misc/lm-sensors/lm_sensors-3.4.0.tar.bz2

rm -rf lm_sensors-3.4.0
tar xf lm_sensors-3.4.0.tar.bz2
pushd  lm_sensors-3.4.0

make PREFIX=/usr        \
     BUILD_STATIC_LIB=0 \
     MANDIR=/usr/share/man

make PREFIX=/usr        \
     BUILD_STATIC_LIB=0 \
     MANDIR=/usr/share/man install &&

install -v -m755 -d /usr/share/doc/lm_sensors-3.4.0 &&
cp -rv              README INSTALL doc/* \
                    /usr/share/doc/lm_sensors-3.4.0

sensors-detect

popd
rm -rf lm_sensors-3.4.0
