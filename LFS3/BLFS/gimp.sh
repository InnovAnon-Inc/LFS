set -eo nounset

cd /sources

for k in \
https://download.gimp.org/pub/gimp/v2.8/gimp-2.8.22.tar.bz2 \
https://download.gimp.org/pub/gimp/help/gimp-help-2.8.2.tar.bz2 ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf gimp-2.8.22
tar xf gimp-2.8.22.tar.bz2
pushd  gimp-2.8.22

sed -i '/gegl/s/2/3/' configure &&
sed -i '70,75 d' app/core/gimpparamspecs-duplicate.c

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --without-gvfs &&
make

make install

gtk-update-icon-cache &&
update-desktop-database

ALL_LINGUAS="ca da de el en en_GB es fr it ja ko nl nn pt_BR ru sl sv zh_CN" \
./configure --prefix=/usr &&

make

make install &&
chown -R root:root /usr/share/gimp/2.0/help

popd
rm -rf gimp-2.8.22
