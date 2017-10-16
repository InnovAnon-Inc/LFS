set -eo nounset

cd /sources

test -f desktop-file-utils-0.23.tar.xz || \
wget --no-check-certificate \
	https://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.23.tar.xz

rm -rf desktop-file-utils-0.23
tar xf desktop-file-utils-0.23.tar.xz
pushd  desktop-file-utils-0.23

./configure --prefix=/usr &&
make

make install

update-desktop-database /usr/share/applications

popd
rm -rf desktop-file-utils-0.23
