set -eo nounset

cd /sources

test -f pulseaudio-11.1.tar.xz || \
wget --no-check-certificate \
	https://www.freedesktop.org/software/pulseaudio/releases/pulseaudio-11.1.tar.xz

rm -rf pulseaudio-11.1
tar xf pulseaudio-11.1.tar.xz
pushd  pulseaudio-11.1

./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-bluez4     \
            --disable-bluez5     \
            --disable-rpath      &&
make

make install

rm -fv /etc/dbus-1/system.d/pulseaudio-system.conf

popd
rm -rf pulseaudio-11.1
