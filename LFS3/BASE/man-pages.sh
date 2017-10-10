set -eo nounset

cd /sources

#

rm -rf man-pages-4.13
tar xf man-pages-4.13.tar.xz
pushd  man-pages-4.13

make install

popd
rm -rf man-pages-4.13
