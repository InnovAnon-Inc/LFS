set -eo nounset

cd /sources

#

rm -rf man-pages-4.12
tar xf man-pages-4.12.tar.xz
pushd  man-pages-4.12

make install

popd
rm -rf man-pages-4.12
